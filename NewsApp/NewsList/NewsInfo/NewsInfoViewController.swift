//
//  NewsInfoViewController.swift
//  NewsApp
//
//  Created by Admin on 08.11.2023.
//

import UIKit
import SafariServices

final class NewsInfoViewController: UIViewController {
    
    private let mainView = NewsInfoView()
    private let item: Article
    private let image: UIImage
    
    init(item: Article, image: UIImage) {
        self.item = item
        self.image = image
        
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

        mainView.configure(image: image, title: item.title, discription: item.description)
        
        mainView.button.addTarget(self, action: #selector(ButtonTapped), for: .touchDown)
    }
    
    @objc
    private func ButtonTapped() {
        let vc = SFSafariViewController(url: item.url)
        
        present(vc, animated: true)
    }
}
