//
//  NewsListView.swift
//  NewsApp
//
//  Created by Admin on 06.11.2023.
//

import UIKit

final class NewsListView: UIView {
    
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
        
        setupTableView()
        setupActivityIndicator()
        
        activityIndicator.startAnimating()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    private func setupActivityIndicator() {
        addSubview(activityIndicator)
        
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func tableLoadingView() -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 100))
        
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(indicator)
        
        indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        indicator.startAnimating()
        
        return view
    }
    
    func publishDate(for dateResult: String?) -> String? {
        guard let dataResult = dateResult else { return nil }
        
        guard let date = ISO8601DateFormatter().date(from: dataResult) else { return nil }
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        
        return formatter.string(from: date)
    }
}
