//
//  SavedViewController.swift
//  NewsApp
//
//  Created by Admin on 06.11.2023.
//

import UIKit

class SavedViewController: UIViewController {
    
    private var items: [Article] {
        FavoriteStorage.shared.items
    }
    
    let mainView = SavedView()
    let imagesProvider: ImagesProvider
    
    init(imagesProvider: ImagesProvider) {
        self.imagesProvider = imagesProvider
        
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
        
        title = "Сохраненные"

        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(favoriteListChanged),
            name: FavoriteStorage.notification,
            object: nil)
    }
    
    @objc
    func favoriteListChanged() {
        mainView.tableView.reloadData()
    }
}

extension SavedViewController: UITableViewDataSource {
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
        let publushedDate = publishDate(for: item.publishedAt)
        
        cell.configure(arcticle: item, publishedAt: publushedDate, imagesProvider: imagesProvider)
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func publishDate(for dateResult: String?) -> String? {
       guard let dataResult = dateResult else { return nil }
       
       guard let date = ISO8601DateFormatter().date(from: dataResult) else { return nil }
       
       let formatter = DateFormatter()
       formatter.dateStyle = .medium
       
       return formatter.string(from: date)
  }
}

extension SavedViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        let image = imagesProvider.image(for: item.urlToImage)
        let vc = NewsInfoViewController(item: item, image: (image ?? UIImage(named: "logo"))!)
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
