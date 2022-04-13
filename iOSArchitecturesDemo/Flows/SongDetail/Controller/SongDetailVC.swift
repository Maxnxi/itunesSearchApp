//
//  SongDetailVC.swift
//  iOSArchitecturesDemo
//
//  Created by Maksim on 04.08.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

class SongDetailVC: UIViewController {

    public var song: ITunesSong
    
    private let  imageDownloader = ImageDownloader()
    
//    lazy var headerDetailViewController = SongDetailHeaderViewController(song: song)
    
    private var songDetailView: SongDetailView {
        return self.view as! SongDetailView
    }
    
    
    
    init(song: ITunesSong) {
        self.song = song
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.title = "Music Search"
        
        configureUI()
    }
    
    func configureUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .white
        navigationItem.largeTitleDisplayMode = .never
        
        addHeaderViewController()
    }
    
    func addHeaderViewController() {
        
    }
    

}
