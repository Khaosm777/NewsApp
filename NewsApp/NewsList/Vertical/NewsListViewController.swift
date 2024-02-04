//
//  NewsListViewController.swift
//  NewsApp
//
//  Created by Admin on 06.11.2023.
//

import UIKit

final class NewsListViewController: UIViewController {
    
    //MARK: - UI Elements
    
    private let mainView = NewsListView()
    private let customNavigationLeftView = TaBarView()
    private var selectedCategory = Category.Bitcoin
    private let imagesProvider: ImagesProvider
    
    weak var delegate: CategoryViewControllerDelegate?
    
    //MARK: - Life cicle
    
    init(imagesProvider: ImagesProvider) {
        self.imagesProvider = imagesProvider
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedCategoryView))
        
        customNavigationLeftView.addGestureRecognizer(tapGesture)
        customNavigationLeftView.configure(title: selectedCategory.displayTitle)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchButtonTapped))
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: customNavigationLeftView)
        
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        
        fetchData()
    }
    
    //MARK: - Methods
    
    private func fetchData() {
        mainView.networkService.fetchData(q: selectedCategory.requestTitle,page: mainView.page) { [weak self] articles in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.mainView.items += articles
                self.mainView.activityIndicator.stopAnimating()
                self.mainView.tableView.reloadData()
                self.mainView.tableView.tableFooterView = nil
                self.mainView.tableView.tableHeaderView = nil
            }
        }
    }
    
    @objc
    private func tappedCategoryView() {
        let vc = CategoryViewController(selectedCategory: selectedCategory)
        vc.modalPresentationStyle = .fullScreen
        vc.delegate = self
        present(vc, animated: true)
    }
    
    @objc
    private func searchButtonTapped() {
        let vc = SearchResultViewController(items: mainView.items, imagesProvider: imagesProvider)
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - UITableViewDelegate

extension NewsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = mainView.items[indexPath.row]
        let image = imagesProvider.image(for: item.urlToImage)
        let vc = NewsInfoViewController(item: item, image: (image ?? UIImage(named: "logo"))!)
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == mainView.items.count - 5 {
            mainView.tableView.tableFooterView = mainView.tableLoadingView()
            mainView.page += 1
            fetchData()
        }
    }
}

//MARK: - CategoryViewControllerDelegate

extension NewsListViewController: CategoryViewControllerDelegate {
    func doneButtonTapped(selectedCategory: Category) {
        
        self.selectedCategory = selectedCategory
        
        customNavigationLeftView.configure(title: selectedCategory.displayTitle)
        mainView.tableView.tableHeaderView = mainView.tableLoadingView()
        
        mainView.items = []
        mainView.page = 1
        fetchData()
    }
}

//MARK: - UITableViewDataSource

extension NewsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mainView.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: NewsListTableViewCell.reuseId,
            for: indexPath
        ) as? NewsListTableViewCell else {
            fatalError("Can not dequeue NewsListTableViewCell")
        }
        
        let item = mainView.items[indexPath.row]
        let publushedDate = mainView.publishDate(for: item.publishedAt)
        
        cell.configure(arcticle: item, publishedAt: publushedDate, imagesProvider: imagesProvider)
        
        cell.selectionStyle = .none
        
        return cell
    }
}
