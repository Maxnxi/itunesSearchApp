//
//  AppVersionInfoDetailView.swift
//  iOSArchitecturesDemo
//
//  Created by Maksim on 03.08.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

//Отображайте (как и в самом appStore) заголовок, номер версии, ее описание и дату выхода.

import UIKit

class AppVersionInfoDetailView: UIView {
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 1
        return label
    }()
    
    private(set) lazy var versionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    }()
    
    private(set) lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private(set) lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 1
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        addSubview(titleLabel)
        addSubview(versionLabel)
        addSubview(dateLabel)
        addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20.0),
            titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16.0),
            
            versionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12.0),
            versionLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12.0),
            dateLabel.leftAnchor.constraint(greaterThanOrEqualTo: versionLabel.rightAnchor, constant: 50.0),
            dateLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20.0),
            
            descriptionLabel.topAnchor.constraint(equalTo: versionLabel.bottomAnchor, constant: 16.0),
            descriptionLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor),
            descriptionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -20.0)
        ])
    }
}
