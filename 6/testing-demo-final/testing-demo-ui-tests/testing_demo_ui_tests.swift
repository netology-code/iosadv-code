//
//  testing_demo_ui_tests.swift
//  testing-demo-ui-tests
//
//  Created by Mikhail Rakhmalevich on 16.06.2021.
//

import XCTest

class testing_demo_ui_tests: XCTestCase {

    func testNavigationFromListToDetailsAndShare() {
        let app = XCUIApplication()
        app.launch()
        
        let songCell = app.staticTexts["Hiatus Kaiyote"]
        XCTAssert(songCell.waitForExistence(timeout: 5.0))
        
        songCell.tap()
        let shareButton = app.staticTexts["Share"]
        XCTAssert(shareButton.exists)
        
        shareButton.tap()
        let activityList = app.otherElements["ActivityListView"]
        XCTAssert(activityList.waitForExistence(timeout: 5.0))
            
        let copyButton = activityList.buttons["Copy"]
        copyButton.tap()
        let successAlert = app.alerts["Success"]
        XCTAssert(successAlert.waitForExistence(timeout: 5.0))
    }
}
