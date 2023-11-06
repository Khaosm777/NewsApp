//
//  SettingViewController.swift
//  NewsApp
//
//  Created by Admin on 06.11.2023.
//

import UIKit

final class SettingViewController: UIViewController {
    
    let newView = SettingView()
    
    override func loadView() {
        view.self = newView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Настройки"
    }
}
