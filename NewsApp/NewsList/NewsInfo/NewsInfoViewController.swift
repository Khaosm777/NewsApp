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

        mainView.configure(image: image, title: item.title, discription: item.description, publishedAt: publishDate(for: item.publishedAt))
        
        mainView.button.addTarget(self, action: #selector(ButtonTapped), for: .touchDown)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "square.and.arrow.up"),
            style: .plain,
            target: self,
            action: #selector(shareButtonTapped)
        )
        
        mainView.isFavorite = FavoriteStorage.shared.contains(item)
        
        mainView.buttonSave.addTarget(self, action: #selector(saveTapped), for: .touchDown)
    }
    
    @objc
    private func saveTapped() {
        mainView.isFavorite = !mainView.isFavorite
        mainView.updateAddToFavoritesButton()
        FavoriteStorage.shared.handle(item)
    }
    
    @objc
    private func shareButtonTapped() {
        let vc = UIActivityViewController(activityItems: ["one"], applicationActivities: nil)
        present(vc, animated: true)
    }
    
    @objc
    private func ButtonTapped() {
        let vc = SFSafariViewController(url: item.url)
        
        present(vc, animated: true)
    }
    
    private func publishDate(for dateResult: String?) -> String? {
        guard let dataResult = dateResult else { return nil }
        
        let formater = DateFormatter()
        formater.dateFormat = "yyyy-MM-dd'T'hh:mm:ssZ"
        
        guard let date = formater.date(from: dataResult) else { return nil}
        
        formater.dateStyle = .medium
        
        return formater.string(from: date)
    }
}
