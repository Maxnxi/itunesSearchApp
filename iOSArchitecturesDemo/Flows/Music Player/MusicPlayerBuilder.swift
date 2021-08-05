//
//  MusicPlayerBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Maksim on 05.08.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class MusicPlayerBuilder {

  static func build(currentTrack: ITunesSong, allTracks: [ITunesSong]) -> UIViewController {
    let viewModel = MusicPlayerViewModel(currentTrack: currentTrack, allTracks: allTracks)
    let controller = MusicPlayerViewController(viewModel: viewModel)
    return controller
  }

}
