//
//  AppScreenShotsCell.swift
//  iOSArchitecturesDemo
//
//  Created by Maksim on 04.08.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class AppScreenShotsCell: UICollectionViewCell {
    
    static let reuseIdentifier = "AppScreenShotsCell"
    
    private let screenShotImgView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addScreenShotsImgView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImage(image: UIImage) {
        screenShotImgView.image = image
    }
    
    private func addScreenShotsImgView() {
        addSubview(screenShotImgView)
        
        screenShotImgView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            screenShotImgView.topAnchor.constraint(equalTo: topAnchor),
            screenShotImgView.leftAnchor.constraint(equalTo: leftAnchor),
            screenShotImgView.rightAnchor.constraint(equalTo: rightAnchor),
            screenShotImgView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
