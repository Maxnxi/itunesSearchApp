//
//  AppDetailFullScreenShotVC.swift
//  iOSArchitecturesDemo
//
//  Created by Maksim on 04.08.2021.
//  Copyright © 2021 ekireev. All rights reserved.
//

import UIKit

final class AppDetailFullScreenShotVC: UIViewController {
    
    private lazy var pageController: UIPageViewController = {
      let pageVC = UIPageViewController(transitionStyle: .scroll,
                                        navigationOrientation: .horizontal,
                                        options: nil)
      return pageVC
    }()
    
    private let app: ITunesApp
    private var currentIndex: Int
    
    init(app: ITunesApp, indexToStart: Int) {
        self.app = app
        self.currentIndex = indexToStart
        super.init(nibName:nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
      super.viewDidLoad()
      pageController.dataSource = self
      addPageController()
    }
    
    private func addPageController() {
      addChild(self.pageController)
      view.addSubview(self.pageController.view)
      pageController.didMove(toParent: self)
        
      pageController.view.backgroundColor = .clear
      
      let imageUrl = app.screenshotUrls[currentIndex]
        pageController.setViewControllers([SingleScreenshotViewController(screenshotUrl: imageUrl)],
                                          direction: .forward, animated: true, completion: nil)
        
        guard let pageView = pageController.view else { return }
        
        pageView.translatesAutoresizingMaskIntoConstraints = false
      NSLayoutConstraint.activate([
        pageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        pageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        pageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        pageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
      ])
    }
    
}

extension AppDetailFullScreenShotVC: UIPageViewControllerDataSource {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        app.screenshotUrls.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        currentIndex
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard currentIndex > .zero else { return nil }
        currentIndex -= 1
        let imageUrl = app.screenshotUrls[currentIndex]
        let pageVC = SingleScreenshotViewController(screenshotUrl: imageUrl)
        return pageVC
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard currentIndex < app.screenshotUrls.count - 1 else { return nil }
        currentIndex += 1
        let imageUrl = app.screenshotUrls[currentIndex]
        let pageVC = SingleScreenshotViewController(screenshotUrl: imageUrl)
        return pageVC
    }
    
    
}
