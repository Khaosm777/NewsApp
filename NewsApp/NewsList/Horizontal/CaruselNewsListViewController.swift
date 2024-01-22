//
//  CaruselNewsListViewController.swift
//  NewsApp
//
//  Created by Admin on 20.11.2023.
//

import UIKit

class CaruselNewsListViewController: UIViewController {
    
    let customNavigationLeftView = TaBarView()
    var selectedCategory = Category.apple
    let mainView = CaruselNewsListView()
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tappedCategoryView))
        customNavigationLeftView.addGestureRecognizer(tapGesture)
        customNavigationLeftView.configure(title: selectedCategory.displayTitle)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: nil, action: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: customNavigationLeftView)
        
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        
        mainView.collectionView.register(CaruselCollectionViewCell.self, forCellWithReuseIdentifier: CaruselCollectionViewCell.reuseId)
        
        fetchData()
    }
    
    func fetchData() {
        mainView.networkService.fetchData(q: selectedCategory.requestTitle,page: mainView.page) { [weak self] articles in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.mainView.items += articles
                self.mainView.activityIndicator.stopAnimating()
                self.mainView.collectionView.reloadData()
            }
        }
    }
    
    @objc
    func tappedCategoryView() {
        let vc = CategoryViewController(selectedCategory: selectedCategory)
        vc.modalPresentationStyle = .fullScreen
        vc.delegate = self
        present(vc, animated: true)
    }
}

extension CaruselNewsListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: collectionView.bounds.size.width - 100, height: collectionView.bounds.size.height - 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = mainView.items[indexPath.item]
        let image = mainView.imagesProvider.image(for: item.urlToImage)
        let vc = NewsInfoViewController(item: item, image: image ?? UIImage())
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension CaruselNewsListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        mainView.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CaruselCollectionViewCell.reuseId,
            for: indexPath
        ) as? CaruselCollectionViewCell else {
            fatalError( "Can not dequeue CaruselCollectionViewCell")
        }
        
        let item = mainView.items[indexPath.item]
        cell.configure(arcticle: item, imagesProvider: mainView.imagesProvider)
        
        return cell
    }
}


extension CaruselNewsListViewController: CategoryViewControllerDelegate {
    func doneButtonTapped(selectedCategory: Category) {
        
        self.selectedCategory = selectedCategory
        
        customNavigationLeftView.configure(title: selectedCategory.displayTitle)
        
        mainView.items = []
        mainView.page = 1
        fetchData()
    }
}

