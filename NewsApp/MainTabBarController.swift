//
//  MainTabBarController.swift
//  NewsApp
//
//  Created by Admin on 06.11.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    private var newsListViewController: UINavigationController {
        let vc = NewsListViewController()
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.tabBarItem = UITabBarItem(
            title: "Новости",
            image: UIImage(systemName: "newspaper"),
            selectedImage: UIImage(systemName: "newspaper.fill")
        )
        return navigationController
    }
    
    private var myNewsViewController: UINavigationController {
        let vc = MyNewsViewController()
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.tabBarItem = UITabBarItem(
            title: "Мои новости",
            image: UIImage(systemName: "list.bullet.rectangle.portrait"),
            selectedImage: UIImage(systemName: "list.bullet.rectangle.portrait.fill")
        )
        return navigationController
    }
    
    private var savedViewController: UINavigationController {
        let vc = SavedViewController()
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.tabBarItem = UITabBarItem(
            title: "Сохраненные",
            image: UIImage(systemName: "square.and.arrow.down.on.square"),
            selectedImage: UIImage(systemName: "square.and.arrow.down.on.square.fill")
        )
        return navigationController
    }
    
    private var settingViewController: UINavigationController {
        let vc = SettingViewController()
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.tabBarItem = UITabBarItem(
            title: "Настройки",
            image: UIImage(systemName: "person.circle"),
            selectedImage: UIImage(systemName: "person.circle.fill")
        )
        return navigationController
    }

    init() {
        super.init(nibName: nil, bundle: nil)
                   
        viewControllers = [newsListViewController, myNewsViewController, savedViewController, settingViewController]
        
        tabBar.tintColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
