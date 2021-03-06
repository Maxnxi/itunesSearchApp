//
//  SongDetailView.swift
//  iOSArchitecturesDemo
//
//  Created by Maksim on 04.08.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class SongDetailView: UIView {
   
    let imageView = UIImageView()
    let throbber = UIActivityIndicatorView(style: .gray)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    private func configureUI() {
        self.backgroundColor = .white
        self.addImageView()
        self.addImageViewThrobber()
        self.setupConstraints()
    }
    
    private func addImageView() {
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        self.imageView.layer.cornerRadius = 10.0
        self.imageView.layer.masksToBounds = true
        self.addSubview(self.imageView)
    }
    
    private func addImageViewThrobber() {
        self.throbber.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.addSubview(self.throbber)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.imageView.widthAnchor.constraint(equalToConstant: 100.0),
            self.imageView.heightAnchor.constraint(equalToConstant: 100.0),
            self.imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            self.throbber.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.throbber.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ])
    }
}
