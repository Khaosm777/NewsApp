//
//  NewsListView.swift
//  NewsApp
//
//  Created by Admin on 06.11.2023.
//

import UIKit

class NewsListView: UIView {
    
    var items: [Product] = [
    Product(title: "Чинхо", image: UIImage(named: "logo")!),
    Product(title: "Гучинги", image: UIImage(named: "logo")!),
    Product(title: "Башрой", image: UIImage(named: "logo")!),
    Product(title: "Нихлой", image: UIImage(named: "logo")!)
    ]
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.rowHeight = 100
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Colors.mainColor
        
        tableView.register(NewsListTableViewCell.self, forCellReuseIdentifier: NewsListTableViewCell.reuseId)
        
        tableView.dataSource = self
        
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTableView() {
        addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true

    }
}

extension NewsListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: NewsListTableViewCell.reuseId,
            for: indexPath
        ) as? NewsListTableViewCell else {
            fatalError("Can not dequeue NewsListTableViewCell")
        }
        
        let item = items[indexPath.row]
        cell.configure(image: item.image, title: item.title)
        
        cell.selectionStyle = .none
        
        return cell
    }
}
