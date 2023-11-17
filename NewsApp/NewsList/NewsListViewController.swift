//
//  NewsListViewController.swift
//  NewsApp
//
//  Created by Admin on 06.11.2023.
//

import UIKit

final class NewsListViewController: UIViewController {
    
    let mainView = NewsListView()
    
    override func loadView() {
        view.self = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Новости"
        
        mainView.tableView.delegate = self
    }
}

extension NewsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = mainView.items[indexPath.row]
        let image = mainView.imagesProvider.image(for: item.urlToImage)
        let vc = NewsInfoViewController(item: item, image: image ?? UIImage())
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == mainView.items.count - 5 {
            mainView.setupViewIndicator()
            mainView.page += 1
            mainView.fetchData()
        }
    }
}
