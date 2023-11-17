//
//  ArcticleViewControllerProvider.swift
//  NewsApp
//
//  Created by Admin on 17.11.2023.
//

import UIKit

struct ArcticleViewControllerProvider {
    
    static var arcticleViewControllerProvider: UIViewController {
        let isUpdateModeEnabled = UserDefaults.standard.bool(forKey: "actionSwitch")
        
        if isUpdateModeEnabled {
            return NewsList2ViewController()
        } else {
            return NewsListViewController()
        }
    }
}
