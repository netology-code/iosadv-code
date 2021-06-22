//
//  SongDetailsViewController.swift
//  testing-demo
//
//  Created by Mikhail Rakhmalevich on 11.06.2021.
//

import UIKit

class SongDetailsViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet private weak var artworkImageView: UIImageView!
    @IBOutlet private weak var artistLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    
    var song: Song!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        artworkImageView.image = song.artwork
        artistLabel.text = song.artist
        titleLabel.text = song.title
    }
    
    // MARK: - Actions
    @IBAction func actionShare(_ sender: Any) {
        let songUrl = URL(string: "songsappscheme://opensong?id=\(song.id)")!
        let attachments: [Any] = ["Check the song \(song.artist) - \(song.title) in my app: \(songUrl)"]
        let activityViewController = UIActivityViewController(activityItems: attachments, applicationActivities: nil)
        activityViewController.excludedActivityTypes = [.print, .assignToContact, .saveToCameraRoll, .addToReadingList, .postToFlickr,
                                                        .postToVimeo, .postToTencentWeibo, .openInIBooks, .markupAsPDF]
        activityViewController.completionWithItemsHandler = { activity, success, items, error in
            if success {
                self.displaySuccessAlert()
            } else {
                if error != nil {
                    self.displayErrorAlert()
                } else {
                    // action cancelled
                }
            }
        }
        present(activityViewController, animated: true, completion: nil)
    }
    
    // MARK: - Utils
    private func displaySuccessAlert() {
        let alert = UIAlertController(title: "Success", message: "Thank you for sharing!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cool", style: .cancel))
        present(alert, animated: true)
    }
    
    private func displayErrorAlert() {
        let alert = UIAlertController(title: "Failure", message: "Something went wrong", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel))
        present(alert, animated: true)
    }
}

