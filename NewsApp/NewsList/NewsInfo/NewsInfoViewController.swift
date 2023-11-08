//
//  NewsInfoViewController.swift
//  NewsApp
//
//  Created by Admin on 08.11.2023.
//

import UIKit

final class NewsInfoViewController: UIViewController {
    
    private let mainView = NewsInfoView()
    private let item: Product
    
    init(item: Product) {
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

        mainView.configure(image: item.image, title: item.title)
    }
}
