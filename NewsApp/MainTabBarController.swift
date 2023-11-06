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
    
    private var myNewsViewController: UIViewController {
        let vc = MyNewsViewController()
        vc.tabBarItem = UITabBarItem(
            title: "My News",
            image: UIImage(systemName: "list.bullet.rectangle.portrait"),
            selectedImage: UIImage(systemName: "list.bullet.rectangle.portrait.fill")
        )
        return vc
    }
    
    private var savedViewController: UIViewController {
        let vc = SavedViewController()
        vc.tabBarItem = UITabBarItem(
            title: "Saved",
            image: UIImage(systemName: "square.and.arrow.down.on.square"),
            selectedImage: UIImage(systemName: "square.and.arrow.down.on.square.fill")
        )
        return vc
    }
    
    private var settingViewController: UIViewController {
        let vc = SettingViewController()
        vc.tabBarItem = UITabBarItem(
            title: "Setting",
            image: UIImage(systemName: "person.circle"),
            selectedImage: UIImage(systemName: "person.circle.fill")
        )
        return vc
    }

    init() {
        super.init(nibName: nil, bundle: nil)
                   
        viewControllers = [newsListViewController, myNewsViewController, savedViewController, settingViewController]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
