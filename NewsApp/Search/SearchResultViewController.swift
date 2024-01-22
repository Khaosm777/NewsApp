//
//  SearchResultViewController.swift
//  NewsApp
//
//  Created by Admin on 22.01.2024.
//

import UIKit

class SearchResultViewController: UIViewController {
    
    var itemsAll: [Article] = []
    let imagesProvider: ImagesProvider
    var isSearching = false
    var searchedItems: [Article] = []
    
    var items: [Article] {
        isSearching ? searchedItems : itemsAll
    }
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.rowHeight = 120
        return tv
    }()
    
    init(items: [Article], imagesProvider: ImagesProvider) {
        self.itemsAll = items
        self.imagesProvider = imagesProvider
        
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.mainColor
        
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        
        navigationItem.searchController = searchController
        
        title = "Search"
        
        setupTableView()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsListTableViewCell.self, forCellReuseIdentifier: NewsListTableViewCell.reuseId)
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}


extension SearchResultViewController: UITableViewDataSource {
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
//        let publushedDate = publishDate(for: item.publishedAt)
        
        cell.configure(arcticle: item, publishedAt: "22", imagesProvider: imagesProvider)
        
        cell.selectionStyle = .none
        
        return cell
    }
}

extension SearchResultViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        let image = imagesProvider.image(for: item.urlToImage)
        let vc = NewsInfoViewController(item: item, image: (image ?? UIImage(named: "logo"))!)
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension SearchResultViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        
        searchedItems = itemsAll.filter { item in
            item.title.lowercased().contains(
                text.lowercased()
            )
        }
        tableView.reloadData()
    }
}

extension SearchResultViewController: UISearchBarDelegate {
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        isSearching = false
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearching = true
    }
}

