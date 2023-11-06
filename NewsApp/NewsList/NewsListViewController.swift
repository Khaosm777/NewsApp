//
//  NewsListViewController.swift
//  NewsApp
//
//  Created by Admin on 06.11.2023.
//

import UIKit

final class NewsListViewController: UIViewController {
    
    let newView = NewsListView()
    
    override func loadView() {
        view.self = newView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Новости"
    }
}
