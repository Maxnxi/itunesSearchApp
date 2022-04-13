//
//  AppScreenShotsVC.swift
//  iOSArchitecturesDemo
//
//  Created by Maksim on 04.08.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class AppScreenShotsVC: UIViewController {
    
    private let app: ITunesApp
    
    var selectedIndex: Int = 0
    
    private var appScreenShotsView: AppScreenShotsView {
        return self.view as! AppScreenShotsView
    }
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.view = AppScreenShotsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appScreenShotsView.collectionView.delegate = self
        appScreenShotsView.collectionView.dataSource = self
        appScreenShotsView.collectionView.register(AppScreenShotsCell.self, forCellWithReuseIdentifier: AppScreenShotsCell.reuseIdentifier)
    }

}

extension AppScreenShotsVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.app.screenshotUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: AppScreenShotsCell.reuseIdentifier, for: indexPath) as? AppScreenShotsCell else { return UICollectionViewCell() }
        ImageDownloader().getImage(fromUrl: app.screenshotUrls[indexPath.row]) { [weak self] image, _ in
            guard let image = image else { return }
            DispatchQueue.main.async {
                cell.setImage(image: image)
            }
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex = indexPath.item
        UIApplication.shared.sendAction(#selector(AppDetailViewController.didTapOnScreenshot(sender:)), to: nil, from: self, for: nil)
    }
    
}
