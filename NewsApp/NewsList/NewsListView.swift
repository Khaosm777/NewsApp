//
//  NewsListView.swift
//  NewsApp
//
//  Created by Admin on 06.11.2023.
//

import UIKit

final class NewsListView: UIView {
    
    let imagesProvider = ImagesProvider()
    let networkService = ArticleListNetworkService()
 
    var items: [Article] = []
    var page = 1
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.rowHeight = 120
        return tv
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Colors.mainColor
        
        tableView.register(NewsListTableViewCell.self, forCellReuseIdentifier: NewsListTableViewCell.reuseId)
        
        tableView.dataSource = self
        
        setupTableView()
        setupActivityIndicator()
        
        activityIndicator.startAnimating()
        
        fetchData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fetchData() {
        networkService.fetchData(page: page) { [weak self] articles in
            guard let self = self else { return }

            DispatchQueue.main.async {
                self.items += articles
                self.activityIndicator.stopAnimating()
                self.tableView.reloadData()
                self.tableView.tableFooterView = nil
            }
        }
    }
    
    func setupTableView() {
        addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    func setupActivityIndicator() {
        addSubview(activityIndicator)
        
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func setupViewIndicator() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 100))
        
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(indicator)
        
        indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        indicator.startAnimating()
        
        tableView.tableFooterView = view
    }
    
    private func publishDate(for dateResult: String?) -> String? {
        guard let dataResult = dateResult else { return nil }
        
        guard let date = ISO8601DateFormatter().date(from: dataResult) else { return nil }
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter.string(from: date)
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
        let publushedDate = publishDate(for: item.publishedAt)
        
        cell.configure(arcticle: item, publishedAt: publushedDate, imagesProvider: imagesProvider)
        
        cell.selectionStyle = .none
        
        return cell
    }
}
