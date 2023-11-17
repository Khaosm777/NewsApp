//
//  SettingView.swift
//  NewsApp
//
//  Created by Admin on 06.11.2023.
//

import UIKit

class SettingView: UIView {
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Переключение экрана"
        return label
    }()
    
    let switch1: UISwitch = {
        let switch1 = UISwitch()
        switch1.translatesAutoresizingMaskIntoConstraints = false
        return switch1
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Colors.mainColor
        
        setupLaout()
        
//        let isActionSwitchOn = UserDefaults.standard.bool(forKey: "actionSwitch")
//        
//        switch1.isOn = isActionSwitchOn
        
//        switch1.addTarget(self, action: #selector(actionSwitch), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    @objc
//    private func actionSwitch() {
//        UserDefaults.standard.set(switch1.isOn, forKey: "actionSwitch")
//    }
    
    private func setupLaout() {
        setupLabel()
        setupSwitch()
    }
    
    private func setupLabel() {
        addSubview(label)
        
        label.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
    }
    
    private func setupSwitch() {
        addSubview(switch1)
        
        switch1.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true
        switch1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
    }
}
