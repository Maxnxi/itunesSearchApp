//
//  AppCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by Evgeny Kireev on 02/06/2019.
//  Copyright © 2019 ekireev. All rights reserved.
//

import UIKit

struct AppCellModel {
    let title: String
    let subtitle: String?
    let rating: String?
}

final class AppCellModelFactory {
    
    static func cellModel(from model: ITunesApp) -> AppCellModel {
        return AppCellModel(title: model.appName,
                            subtitle: model.company,
                            rating: model.averageRating >>- { "\($0)" })
    }
}

struct SongCellModel {
    let title: String
    let subtitle: String?
    let artWorkImg: UIImage?
}

final class SongCellModelFactory {
    
    static func cellModel(from model: ITunesSong) -> SongCellModel {
        var tmpImage = UIImage()
        if let url = model.artwork {
            ImageDownloader().getImage(fromUrl:url)  { image, _ in
                if let img = image {
                    tmpImage = img
                }
            }
        }
        
        return SongCellModel(title: model.trackName,
                             subtitle: model.artistName,
                             artWorkImg: tmpImage)
    }
}
