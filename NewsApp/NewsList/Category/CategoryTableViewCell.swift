//
//  CategoryTableViewCell.swift
//  NewsApp
//
//  Created by Admin on 23.11.2023.
//

import UIKit

final class CategoryTableViewCell: UITableViewCell {
    
    static let reuseId = "CategoryTableViewCell"
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupLabel()
        
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabel() {
        contentView.addSubview(label)
        
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func configure(title: String, isActive: Bool) {
        label.text = title
        
        if isActive {
            label.textColor = .red
        } else {
            label.textColor = .black
        }
    }
}


