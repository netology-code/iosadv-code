//
//  SongsListViewController.swift
//  testing-demo
//
//  Created by Mikhail Rakhmalevich on 11.06.2021.
//

import Foundation
import UIKit

// MARK: -
class SongTableViewCell: UITableViewCell {
    static let reuseIdentifier = "songCell"
    static let defaultHeight: CGFloat = 80.0
    
    @IBOutlet private weak var artworkImageView: UIImageView!
    @IBOutlet private weak var artistLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    
    func setupWithSong(_ song: Song) {
        artworkImageView.image = song.artwork
        artistLabel.text = song.artist
        titleLabel.text = song.title
    }
}

// MARK: -
class SongsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Properties
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var placeholderLabel: UILabel!
    
    var storage: Storage! = Storage()
    private var songs: [Song] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    private func loadData() {
        placeholderLabel.isHidden = true
        activityIndicator.startAnimating()
        storage.fetchSongs { [weak self] result in
            guard let self = self else { return }
            self.activityIndicator.stopAnimating()
            switch result {
            case .success(let songs):
                self.songs = songs
                self.tableView.reloadData()
                self.placeholderLabel.isHidden = true
            case .failure:
                self.placeholderLabel.isHidden = false
            }
        }
    }
    
    // MARK: - UITableView delegate & datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SongTableViewCell.defaultHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SongTableViewCell.reuseIdentifier) as! SongTableViewCell
        cell.setupWithSong(songs[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let songDetailsViewController = storyboard?.instantiateViewController(withIdentifier: "SongDetailsViewController") as! SongDetailsViewController
        songDetailsViewController.song = songs[indexPath.row]
        navigationController?.pushViewController(songDetailsViewController, animated: true)
    }
}
