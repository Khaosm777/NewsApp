//
//  ArcticleViewControllerProvider.swift
//  NewsApp
//
//  Created by Admin on 17.11.2023.
//

import UIKit

struct ArcticleViewControllerProvider {
    
    static func arcticleViewControllerProvider(imagesProvider: ImagesProvider) -> UIViewController {
        let isUpdateModeEnabled = UserDefaults.standard.bool(forKey: "actionSwitch")
        
        if isUpdateModeEnabled {
            return CaruselNewsListViewController()
        } else {
            return NewsListViewController(imagesProvider: imagesProvider)
        }
    }
}
