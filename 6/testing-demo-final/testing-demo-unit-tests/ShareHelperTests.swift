//
//  ShareHelperTests.swift
//  testing-demo-unit-tests
//
//  Created by Mikhail Rakhmalevich on 12.06.2021.
//

import XCTest
@testable import testing_demo

class ShareHelperTests: XCTestCase {
    
    var shareHelper: ShareHelper!
    var sharePresenter: SharePresenterMock!
    
    override func setUp() {
        super.setUp()
        sharePresenter = SharePresenterMock()
        shareHelper = ShareHelper(presenter: sharePresenter)
    }

    func testShare_verifyUrl_verifySuccessAlert() {
        var assignedContent: String?
        sharePresenter.showShareScreenHandler = { content, completion in
            assignedContent = content
            completion(.success)
        }
        
        XCTAssertEqual(sharePresenter.displaySuccessAlertCounter, 0)
        XCTAssertEqual(sharePresenter.displayErrorAlertCounter, 0)
        
        let dummySong = Song(id: 1, artist: "some artist", title: "some title", artwork: nil)
        shareHelper.shareSong(dummySong)
        
        XCTAssertEqual(assignedContent, "Check the song \(dummySong.artist) - \(dummySong.title) in my app: songsappscheme://opensong?id=\(dummySong.id)")
        XCTAssertEqual(sharePresenter.displaySuccessAlertCounter, 1)
        XCTAssertEqual(sharePresenter.displayErrorAlertCounter, 0)
    }

    func testShare_verifyErrorAlert() {
        sharePresenter.showShareScreenHandler = { _, completion in
            completion(.error)
        }
        
        XCTAssertEqual(sharePresenter.displaySuccessAlertCounter, 0)
        XCTAssertEqual(sharePresenter.displayErrorAlertCounter, 0)
        
        let dummySong = Song(id: 1, artist: "some artist", title: "some title", artwork: nil)
        shareHelper.shareSong(dummySong)
        
        XCTAssertEqual(sharePresenter.displaySuccessAlertCounter, 0)
        XCTAssertEqual(sharePresenter.displayErrorAlertCounter, 1)
    }

    func testAsyncShare_verifyAlert() {
        sharePresenter.showShareScreenHandler = { _, completion in
            DispatchQueue.main.async {
                completion(.success)
            }
        }

        let expectation = expectation(description: "Alert displayed")
        sharePresenter.displaySuccessAlertHandler = {
            expectation.fulfill()
        }

        let dummySong = Song(id: 1, artist: "some artist", title: "some title", artwork: nil)
        shareHelper.shareSong(dummySong)
        
        waitForExpectations(timeout: 1.0)
    }
}
