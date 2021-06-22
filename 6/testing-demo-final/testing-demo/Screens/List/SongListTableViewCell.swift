//
//  SongListTableViewCell.swift
//  testing-demo
//
//  Created by Mikhail Rakhmalevich on 16.06.2021.
//

import Foundation
import UIKit

class SongListTableViewCell: UITableViewCell {
    static let reuseIdentifier = "songListCell"
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
