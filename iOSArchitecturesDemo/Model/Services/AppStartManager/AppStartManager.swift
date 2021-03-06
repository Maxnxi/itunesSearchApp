//
//  AppStartConfigurator.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 19.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppStartManager {
    
    private enum Constants {
        static let appSearchTabBarItem = UITabBarItem(title: "App", image: nil, selectedImage: nil)
        static let musicSearchTabBarItem = UITabBarItem(title: "Music", image: nil, selectedImage: nil)
    }
    
    var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let appVC = SearchBuilder.build()
        //SearchViewController(presenter: SearchViewOutput)
        let musicVC = MusicSearchBuilder.build()
        
        appVC.navigationItem.title = "Search via iTunes"
        
        let navAppVC = configuredNavigationController()
        let navMusicVC = configuredNavigationController()
 
        navAppVC.viewControllers = [appVC]
        navMusicVC.viewControllers = [musicVC]
        
        navAppVC.tabBarItem = Constants.appSearchTabBarItem
        navMusicVC.tabBarItem = Constants.musicSearchTabBarItem
        
        let tabBar = UITabBarController()
        tabBar.viewControllers = [navAppVC, navMusicVC]
        tabBar.tabBar.unselectedItemTintColor = .white
        tabBar.tabBar.tintColor = .cyan
        tabBar.tabBar.barTintColor = .gray
        
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
    }
    
    private func configuredNavigationController() -> UINavigationController {
        let navVC = UINavigationController()
        navVC.navigationBar.barTintColor = UIColor.varna
        navVC.navigationBar.isTranslucent = false
        navVC.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        return navVC
    }
    
   
}
