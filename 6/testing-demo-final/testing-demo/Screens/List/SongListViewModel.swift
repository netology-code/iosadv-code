//
//  SongListViewModel.swift
//  testing-demo
//
//  Created by Mikhail Rakhmalevich on 16.06.2021.
//

import Foundation

// MARK: -
protocol SongListViewModelDelegate: AnyObject {
    func songListViewModelDidUpdate(_ viewModel: SongListViewModel)
}

// MARK: -
class SongListViewModel {
    
    weak var delegate: SongListViewModelDelegate?

    private (set) var songs: [Song] = []
    private (set) var isLoading: Bool = false
    private (set) var shouldShowPlaceholder: Bool = false
    private let songStorage: SongStorage
    
    init(storage: SongStorage) {
        self.songStorage = storage
    }
    
    func loadData() {
        isLoading = true
        shouldShowPlaceholder = false
        delegate?.songListViewModelDidUpdate(self)

        songStorage.fetchSongs { [weak self] result in
            guard let self = self else { return }
            if case .success(let songs) = result {
                self.songs = songs.sorted { $0.artist < $1.artist }
            }
            self.isLoading = false
            self.shouldShowPlaceholder = self.songs.isEmpty
            self.delegate?.songListViewModelDidUpdate(self)
        }
    }
}
