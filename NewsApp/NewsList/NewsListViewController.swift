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
        let vc = NewsInfoViewController(item: item)
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
