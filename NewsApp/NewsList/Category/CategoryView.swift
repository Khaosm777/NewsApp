//
//  CategoryView.swift
//  NewsApp
//
//  Created by Admin on 23.11.2023.
//

import UIKit

final class CategoryView: UIView {
    
    var selectedItem = Category.apple
    
    let buttonDone: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Done", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.rowHeight = 80
        tv.backgroundColor = .clear
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Colors.mainColor
        
        tableView.dataSource = self
        tableView.delegate = self
        
        setupLayout()
                
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        setupButtonDone()
        setupTableView()
    }
    
    private func setupButtonDone() {
        addSubview(buttonDone)
        
        buttonDone.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        buttonDone.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    }
    
    private func setupTableView() {
        addSubview(tableView)
        
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: CGFloat(Category.allCases.count * 80)).isActive = true
    }
}

extension CategoryView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Category.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CategoryTableViewCell.reuseId,
            for: indexPath
        ) as? CategoryTableViewCell else {
            fatalError("Can not deque CategoryTableViewCell")
        }
        
        let item = Category.allCases[indexPath.row]
        let title = item.displayTitle
        
        cell.configure(title: title, isActive: selectedItem == item)
        
        return cell
    }
}

extension CategoryView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newItem = Category.allCases[indexPath.row]
        
        if newItem == selectedItem {
            return
        }
        
        selectedItem = newItem
        
        tableView.reloadData()
    }
}
