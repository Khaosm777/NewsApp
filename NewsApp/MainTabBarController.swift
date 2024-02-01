//
//  MainTabBarController.swift
//  NewsApp
//
//  Created by Admin on 06.11.2023.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    private let imagesProvider = ImagesProvider()
    
    private var newsListViewController: UINavigationController {
        let vc = ArcticleViewControllerProvider.arcticleViewControllerProvider(imagesProvider: imagesProvider)
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.tabBarItem = UITabBarItem(
            title: "Новости",
            image: UIImage(systemName: "newspaper"),
            selectedImage: UIImage(systemName: "newspaper.fill")
            )
        
        navigationController.navigationBar.tintColor = .black
        
        return navigationController
    }
    
    private var savedViewController: UINavigationController {
        let vc = SavedViewController(imagesProvider: imagesProvider)
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.tabBarItem = UITabBarItem(
            title: "Сохраненные",
            image: UIImage(systemName: "square.and.arrow.down.on.square"),
            selectedImage: UIImage(systemName: "square.and.arrow.down.on.square.fill")
        )
        
        navigationController.navigationBar.tintColor = .black

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
        navigationController.navigationBar.tintColor = .black

        
        return navigationController
    }

    init() {
        super.init(nibName: nil, bundle: nil)
                   
        viewControllers = [newsListViewController, savedViewController, settingViewController]
        
        tabBar.tintColor = .red
        tabBar.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
