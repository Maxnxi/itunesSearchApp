//
//  AppVersionInfoDetailVieController.swift
//  iOSArchitecturesDemo
//
//  Created by Maksim on 03.08.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class AppVersionInfoDetailVieController: UIViewController {
    
    private let app: ITunesApp
    
    private var appVersionInfoDetailView: AppVersionInfoDetailView {
        return self.view as! AppVersionInfoDetailView
    }
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = AppVersionInfoDetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillData()
    }
    
    private func fillData() {
        appVersionInfoDetailView.titleLabel.text = "Что нового:"
        appVersionInfoDetailView.versionLabel.text = "Версия: \(app.version ?? "1")"
        appVersionInfoDetailView.dateLabel.text = app.currentVersionReleaseDate
        appVersionInfoDetailView.descriptionLabel.text = app.releaseNotes
    }
}
