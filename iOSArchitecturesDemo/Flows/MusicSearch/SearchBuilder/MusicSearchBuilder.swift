//
//  MusicSearchBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Maksim on 04.08.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class MusicSearchBuilder {
    static func build() -> (UIViewController & MusicSearchViewInput) {
        let presenter = MusicSearchPresenter()
        let viewController = MusicSearchViewController(presenter: presenter)
        presenter.viewInput = viewController
        return viewController
    }
}
