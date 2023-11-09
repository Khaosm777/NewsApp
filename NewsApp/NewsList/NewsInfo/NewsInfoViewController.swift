//
//  NewsInfoViewController.swift
//  NewsApp
//
//  Created by Admin on 08.11.2023.
//

import UIKit

final class NewsInfoViewController: UIViewController {
    
    private let mainView = NewsInfoView()
    private let item: Article
    
    init(item: Article) {
        self.item = item
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view.self = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.configure(image: UIImage(), title: item.title, discription: item.description)
    }
}
