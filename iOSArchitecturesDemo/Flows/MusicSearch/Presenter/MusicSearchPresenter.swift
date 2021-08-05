//
//  MusicSearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Maksim on 04.08.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

protocol MusicSearchControllerInterface: AnyObject {
    var searchResults: [ITunesSong] { get set }
    func showError(error: Error)
    func showNoResults()
    func hideNoResults()
    func throbber(show: Bool)
}

protocol MusicSearchPresenterInterface: AnyObject {
    func didSelectTrack(track: ITunesSong, allTracks: [ITunesSong])
    func shouldSearchWith(query: String)
    func loadImage(url: String?, completion: @escaping (Data?) -> Void)
}

class MusicSearchPresenter {
    weak var controller: (UIViewController & MusicSearchControllerInterface)?
    private let router: MusicSearchRouterInterface
    private let interactor: MusicSearchInteractorInterface
    
    init(interactor: MusicSearchInteractorInterface, router: MusicSearchRouterInterface) {
      self.interactor = interactor
      self.router = router
    }
    
    private func requestSongs(with query: String) {
        interactor.getSongs(forQuery: query) { [weak self] result in
            guard let self = self else { return }
            self.controller?.throbber(show: false)
            switch result{
            case let .success(songs):
                guard !songs.isEmpty else {
                    self.controller?.searchResults = []
                    return
                }
                self.controller?.searchResults = songs
                self.controller?.hideNoResults()
            case let .failure(err):
                self.controller?.showError(error: err)
            }
        }
    }
    
    private func openDetails(with song: ITunesSong) {
        let songDetaillViewController = SongDetailVC(song: song)
        controller?.navigationController?.pushViewController(songDetaillViewController, animated: true)
    }
    
    
    private func getImageFromUrl(url: String?, completion: @escaping (Data?) -> Void) {
      interactor.loadImage(url: url, completion: completion)
    }
}

extension MusicSearchPresenter: MusicSearchPresenterInterface {
    func didSelectTrack(track: ITunesSong, allTracks: [ITunesSong]) {
        router.pushMusicPlayer(withTrack: track, allTracks: allTracks)
    }
    
    func shouldSearchWith(query: String) {
        controller?.throbber(show: true)
        requestSongs(with: query)
    }
    
    func loadImage(url: String?, completion: @escaping (Data?) -> Void) {
        getImageFromUrl(url: url, completion: completion)
    }
    
    
}
