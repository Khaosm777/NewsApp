//
//  MainTabBarController.swift
//  NewsApp
//
//  Created by Admin on 06.11.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    private var newsListViewController: UIViewController {
        let vc = NewsListViewController()
        vc.tabBarItem = UITabBarItem(
            title: "News",
            image: UIImage(systemName: "newspaper"),
            selectedImage: UIImage(systemName: "newspaper.fill")
        )
        return vc
    }

    init() {
        super.init(nibName: nil, bundle: nil)
                   
        viewControllers = [newsListViewController]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
