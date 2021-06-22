//
//  SongDetailsViewController.swift
//  testing-demo
//
//  Created by Mikhail Rakhmalevich on 11.06.2021.
//

import UIKit

// MARK: -
class SongDetailsViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet private weak var artworkImageView: UIImageView!
    @IBOutlet private weak var artistLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    
    var song: Song!
    private var shareHelper: ShareHelper!
        
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        artworkImageView.image = song.artwork
        artistLabel.text = song.artist
        titleLabel.text = song.title
        
        shareHelper = ShareHelper(presenter: self)
    }
    
    // MARK: - Actions
    @IBAction func actionShare(_ sender: Any?) {
        shareHelper.shareSong(song)
    }
}

// MARK: - SongDetailsViewController + SharePresenter
extension SongDetailsViewController: SharePresenter {
    func showShareScreen(content: String, completion: @escaping (ShareResult) -> ()) {
        let activityViewController = UIActivityViewController(activityItems: [content], applicationActivities: nil)
        activityViewController.excludedActivityTypes = [.print, .assignToContact, .saveToCameraRoll, .addToReadingList, .postToFlickr,
                                                        .postToVimeo, .postToTencentWeibo, .openInIBooks, .markupAsPDF]
        activityViewController.completionWithItemsHandler = { _, success, _, error in
            if success {
                completion(.success)
            } else {
                if error != nil {
                    completion(.error)
                } else {
                    completion(.cancelled)
                }
            }
        }
        present(activityViewController, animated: true)
    }
    
    func displaySuccessAlert() {
        let alert = UIAlertController(title: "Success", message: "Song has been shared!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cool", style: .cancel))
        present(alert, animated: true)
    }
    
    func displayErrorAlert() {
        let alert = UIAlertController(title: "Failure", message: "Something went wrong", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alert, animated: true)
    }
}

