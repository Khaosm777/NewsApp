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
        
        let isActionSwitchOn = UserDefaults.standard.bool(forKey: "actionSwitch")
        
        newView.switch1.isOn = isActionSwitchOn
        
        newView.switch1.addTarget(self, action: #selector(actionSwitch), for: .valueChanged)
    }
    
    @objc
    private func actionSwitch() {
        UserDefaults.standard.set(newView.switch1.isOn, forKey: "actionSwitch")
    }
}
