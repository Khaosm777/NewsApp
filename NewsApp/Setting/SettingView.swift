//
//  SettingView.swift
//  NewsApp
//
//  Created by Admin on 06.11.2023.
//

import UIKit

final class SettingView: UIView {
    
//MARK: - UI Elements
    
    private let label: UILabel = {
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
    
//MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Colors.mainColor
        
        setupLaout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - Methods
    
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
