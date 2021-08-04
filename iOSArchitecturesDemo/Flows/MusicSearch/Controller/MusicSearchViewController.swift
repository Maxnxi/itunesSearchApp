//
//  MusicSearchViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Maksim on 04.08.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class MusicSearchViewController: UIViewController {
   
    private let presenter: MusicSearchViewOutput
    
    private var musicSearchView: MusicSearchView {
        return self.view as! MusicSearchView
    }
    
    private let searchService = ITunesSearchService()
    var searchResults = [ITunesSong]() {
        didSet {
            musicSearchView.tableView.isHidden = false
            musicSearchView.tableView.reloadData()
            musicSearchView.searchBar.resignFirstResponder()
        }
    }
    
    // MARK: - Lifecycle
    
    init(presenter: MusicSearchViewOutput) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = MusicSearchView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        musicSearchView.searchBar.delegate = self
        musicSearchView.tableView.register(SongCell.self, forCellReuseIdentifier: "songCell")
        musicSearchView.tableView.delegate = self
        musicSearchView.tableView.dataSource = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.throbber(show: false)
    }
    
}

//MARK: - UITableViewDataSource
extension MusicSearchViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        guard let cell = dequeuedCell as? SongCell else {
            return dequeuedCell
        }
        let song = self.searchResults[indexPath.row]
        
        let cellModel = SongCellModelFactory.cellModel(from: song)
        cell.configure(with: cellModel)
        return cell
    }
}

//MARK: - UITableViewDelegate
extension MusicSearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let song = searchResults[indexPath.row]
        let songDetaillViewController = SongDetailVC(song: song)
        songDetaillViewController.song = song
        presenter.viewDidSelectSong(song: song)
    }
}

//MARK: - UISearchBarDelegate
extension MusicSearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text else {
            searchBar.resignFirstResponder()
            return
        }
        if query.count == 0 {
            searchBar.resignFirstResponder()
            return
        }
        
        presenter.viewDidSearch(with: query)
    }
}

extension MusicSearchViewController: MusicSearchViewInput {
    func throbber(show: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = show
    }
    
    func showError(error: Error) {
        let alert = UIAlertController(title: "Error", message: "\(error.localizedDescription)", preferredStyle: .alert)
        let actionOk = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(actionOk)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showNoResults() {
        self.musicSearchView.emptyResultView.isHidden = false
    }
    
    func hideNoResults() {
        self.musicSearchView.emptyResultView.isHidden = true
    }
}
