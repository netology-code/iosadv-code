//
//  Mocks.swift
//  testing-demo-unit-tests
//
//  Created by Mikhail Rakhmalevich on 16.06.2021.
//

import Foundation
@testable import testing_demo

// MARK: -
class SongStorageMock: SongStorage {
    
    var fetchSongsHandler: ((@escaping (Result<[Song], StorageError>) -> ()) -> ())?
    var fetchSongsCounter: Int = 0
    
    func fetchSongs(completion: @escaping (Result<[Song], StorageError>) -> ()) {
        fetchSongsCounter += 1
        fetchSongsHandler?(completion)
    }
}

// MARK: -
class SharePresenterMock: SharePresenter {
    
    var showShareScreenHandler: ((String, @escaping (ShareResult) -> ()) -> ())?
    var showShareScreenCounter: Int = 0
    var displaySuccessAlertHandler: (() -> ())?
    var displaySuccessAlertCounter: Int = 0
    var displayErrorAlertHandler: (() -> ())?
    var displayErrorAlertCounter: Int = 0
    
    func showShareScreen(content: String, completion: @escaping (ShareResult) -> ()) {
        showShareScreenCounter += 1
        showShareScreenHandler?(content, completion)
    }
    
    func displaySuccessAlert() {
        displaySuccessAlertCounter += 1
        displaySuccessAlertHandler?()
    }
    
    func displayErrorAlert() {
        displayErrorAlertCounter += 1
        displayErrorAlertHandler?()
    }
}

// MARK: -
class SongListViewModelDelegateMock: SongListViewModelDelegate {
    var songListViewModelDidUpdateHandler: (() -> ())?
    var songListViewModelDidUpdateCounter: Int = 0
    
    func songListViewModelDidUpdate(_ viewModel: SongListViewModel) {
        songListViewModelDidUpdateCounter += 1
        songListViewModelDidUpdateHandler?()
    }
}
