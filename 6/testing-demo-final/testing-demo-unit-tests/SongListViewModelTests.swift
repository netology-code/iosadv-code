//
//  SongsListViewModelTests.swift
//  testing-demo-unit-tests
//
//  Created by Mikhail Rakhmalevich on 16.06.2021.
//

import Quick
import Nimble
@testable import testing_demo

class DisplayingSongsList: QuickSpec {
    
    override func spec() {
        describe("displaying songs list") {
            
            var storage: SongStorageMock!
            var viewModel: SongListViewModel!
            var viewModelDelegate: SongListViewModelDelegateMock!
            
            beforeEach {
                storage = SongStorageMock()
                viewModelDelegate = SongListViewModelDelegateMock()
                viewModel = SongListViewModel(storage: storage)
                viewModel.delegate = viewModelDelegate
            }
            
            context("when the app starts to load the list of songs") {
                it("then app should display activity indicator and hide placeholder") {
                    viewModel.loadData()
                    expect(viewModelDelegate.songListViewModelDidUpdateCounter).to(equal(1))
                    expect(viewModel.isLoading).to(equal(true))
                    expect(viewModel.shouldShowPlaceholder).to(equal(false))
                }
            }
            
            context("when loading finished successfully") {
                it("then loaded songs should be displayed in alphabetic order, activity indicator and placeholder should be hidden") {
                    let song1 = Song(id: 1, artist: "test artist 1", title: "test title 1", artwork: nil)
                    let song2 = Song(id: 2, artist: "test artist 2", title: "test title 2", artwork: nil)
                    storage.fetchSongsHandler = { $0(.success([song1, song2])) }
                    viewModel.loadData()
                    expect(viewModelDelegate.songListViewModelDidUpdateCounter).to(equal(2))
                    expect(viewModel.songs[0].id).to(equal(song1.id))
                    expect(viewModel.songs[1].id).to(equal(song2.id))
                    expect(viewModel.isLoading).to(equal(false))
                    expect(viewModel.shouldShowPlaceholder).to(equal(false))
                }
            }
            
            context("when loading finished with error") {
                it("then app should hide activity indicator and show placeholder") {
                    storage.fetchSongsHandler = { $0(.failure(StorageError.anyError)) }
                    viewModel.loadData()
                    expect(viewModelDelegate.songListViewModelDidUpdateCounter).to(equal(2))
                    expect(viewModel.isLoading).to(equal(false))
                    expect(viewModel.shouldShowPlaceholder).to(equal(true))
                }
            }
        }
    }
}
