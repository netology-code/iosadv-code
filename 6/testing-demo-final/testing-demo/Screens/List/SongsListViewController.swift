//
//  SongsListViewController.swift
//  testing-demo
//
//  Created by Mikhail Rakhmalevich on 11.06.2021.
//

import Foundation
import UIKit

class SongsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SongListViewModelDelegate {
    
    // MARK: - Properties
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var placeholderLabel: UILabel!
    
    private var viewModel: SongListViewModel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = SongListViewModel(storage: SongStorageImpl())
        viewModel.delegate = self
        viewModel.loadData()
    }
    
    // MARK: - SongListViewModelDelegate
    func songListViewModelDidUpdate(_ viewModel: SongListViewModel) {
        if viewModel.isLoading {
            activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
        placeholderLabel.isHidden = !viewModel.shouldShowPlaceholder
        tableView.reloadData()
    }
    
    // MARK: - UITableView delegate & datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.songs.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SongListTableViewCell.defaultHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SongListTableViewCell.reuseIdentifier) as! SongListTableViewCell
        cell.setupWithSong(viewModel.songs[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let songDetailsViewController = storyboard?.instantiateViewController(withIdentifier: "SongDetailsViewController") as! SongDetailsViewController
        songDetailsViewController.song = viewModel.songs[indexPath.row]
        navigationController?.pushViewController(songDetailsViewController, animated: true)
    }
}
