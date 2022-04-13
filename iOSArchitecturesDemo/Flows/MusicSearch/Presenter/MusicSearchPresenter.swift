//
//  MusicSearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Maksim on 04.08.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol MusicSearchViewInput: AnyObject {
    var searchResults: [ITunesSong] { get set }
    func showError(error: Error)
    func showNoResults()
    func hideNoResults()
    func throbber(show: Bool)
}

protocol MusicSearchViewOutput: AnyObject {
    func viewDidSearch(with query: String)
    func viewDidSelectSong(song: ITunesSong)
}

class MusicSearchPresenter {
    weak var viewInput: (UIViewController & MusicSearchViewInput)?
    
    private let searchService = ITunesSearchService()
    
    private func requestSong(with query: String) {
        searchService.getSongs(forQuery: query) { [weak self] result in
            guard let self = self else { return }
            self.viewInput?.throbber(show: false)
            result.withValue { songs in
                guard !songs.isEmpty else {
                    self.viewInput?.searchResults = []
                    self.viewInput?.showNoResults()
                    return
                }
                self.viewInput?.hideNoResults()
                self.viewInput?.searchResults = songs
            }
            .withError { self.viewInput?.showError(error: $0)
            }
        }
    }
    
    private func openDetails(with song: ITunesSong) {
        let songDetaillViewController = SongDetailVC(song: song)
        viewInput?.navigationController?.pushViewController(songDetaillViewController, animated: true)
    }
}

extension MusicSearchPresenter: MusicSearchViewOutput {
    func viewDidSearch(with query: String) {
        viewInput?.throbber(show: true)
        requestSong(with: query)
    }
    
    func viewDidSelectSong(song: ITunesSong) {
        openDetails(with: song)
    }
    
    
}
