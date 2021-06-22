//
//  Storage.swift
//  testing-demo
//
//  Created by Mikhail Rakhmalevich on 11.06.2021.
//

import Foundation
import UIKit

// MARK: -
enum StorageError: Error {
    case anyError
}

// MARK: -
protocol SongStorage: AnyObject {
    func fetchSongs(completion: @escaping (Result<[Song], StorageError>) -> ())
}

// MARK: -
class SongStorageImpl: SongStorage {
    
    private let songs: [Song] = [
        Song(id: 1, artist: "Hiatus Kaiyote", title: "Red Room", artwork: UIImage(named: "artwork_redroom")),
        Song(id: 2, artist: "Oko Ebombo", title: "Black Bowie", artwork: UIImage(named: "artwork_black_bowie")),
        Song(id: 3, artist: "daste.", title: "either way", artwork: UIImage(named: "artwork_either_way")),
        Song(id: 4, artist: "Caribou", title: "Bees", artwork: UIImage(named: "artwork_bees")),
        Song(id: 5, artist: "slowthai", title: "nhs", artwork: UIImage(named: "artwork_nhs"))
    ]
    
    func fetchSongs(completion: @escaping (Result<[Song], StorageError>) -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            completion(.success(self.songs))
        }
    }
}
