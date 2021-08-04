//
//  SingleScreenshotViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Maksim on 04.08.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class SingleScreenshotViewController: UIViewController {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let screenshotUrl: String
    
    init(screenshotUrl: String) {
        self.screenshotUrl = screenshotUrl
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
      super.loadView()
      self.view = imageView
    }
    
    override func viewDidLoad() {
      super.viewDidLoad()
      loadImage()
    }
    
    private func loadImage() {
      ImageDownloader().getImage(fromUrl: screenshotUrl) { [weak self] image, _ in
        self?.imageView.image = image
      }
    }
}
