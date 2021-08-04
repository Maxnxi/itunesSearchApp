//
//  SongCell.swift
//  iOSArchitecturesDemo
//
//  Created by Maksim on 04.08.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        return label
    }()
    
    private(set) lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 13.0)
        return label
    }()
    
    private(set) lazy var imgeView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10.0
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    // MARK: - Methods
    
    func configure(with cellModel: SongCellModel) {
        self.titleLabel.text = cellModel.title
        self.subtitleLabel.text = cellModel.subtitle
        self.imgeView.image = cellModel.artWorkImg
    }
    
    // MARK: - UI
    
    override func prepareForReuse() {
        [self.titleLabel, self.subtitleLabel].forEach { $0.text = nil }
        self.imgeView.image = nil
    }
    
    private func configureUI() {
        self.addImageView()
        self.addTitleLabel()
        self.addSubtitleLabel()
    }
    
    private func addImageView() {
        self.contentView.addSubview(imgeView)
        NSLayoutConstraint.activate([
            imgeView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16.0),
            //imgeView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            
            imgeView.widthAnchor.constraint(equalToConstant: 40.0),
            imgeView.heightAnchor.constraint(equalToConstant: 40.0),
            imgeView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 16.0)
            ])
    }
    
    private func addTitleLabel() {
        self.contentView.addSubview(self.titleLabel)
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            self.titleLabel.leftAnchor.constraint(equalTo: imgeView.rightAnchor, constant: 12.0),
            self.titleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }
    
    private func addSubtitleLabel() {
        self.contentView.addSubview(self.subtitleLabel)
        NSLayoutConstraint.activate([
            self.subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 4.0),
            self.subtitleLabel.leftAnchor.constraint(equalTo: imgeView.rightAnchor, constant: 12.0),
            self.subtitleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -40.0)
            ])
    }
    
    
}
