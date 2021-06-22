//
//  ShareHelper.swift
//  testing-demo
//
//  Created by Mikhail Rakhmalevich on 16.06.2021.
//

import Foundation

// MARK: -
enum ShareResult {
    case success
    case error
    case cancelled
}

// MARK: -
protocol SharePresenter {
    func showShareScreen(content: String, completion: @escaping (ShareResult) -> ())
    func displaySuccessAlert()
    func displayErrorAlert()
}

// MARK: -
class ShareHelper {
            
    let presenter: SharePresenter
    
    init(presenter: SharePresenter) {
        self.presenter = presenter
    }
    
    func shareSong(_ song: Song) {
        let songUrl = URL(string: "songsappscheme://opensong?id=\(song.id)")!
        let content = "Check the song \(song.artist) - \(song.title) in my app: \(songUrl)"
        presenter.showShareScreen(content: content) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success:
                self.presenter.displaySuccessAlert()
            case .error:
                self.presenter.displayErrorAlert()
            case .cancelled:
                break
            }
        }
    }
}
