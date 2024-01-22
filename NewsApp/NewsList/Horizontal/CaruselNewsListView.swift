//
//  CaruselNewsListView.swift
//  NewsApp
//
//  Created by Admin on 20.11.2023.
//

import UIKit

class CaruselNewsListView: UIView {
    
    let imagesProvider = ImagesProvider()
    let networkService = ArticleListNetworkService()
 
    var items: [Article] = []
    var page = 1
    
    let collectionView: UICollectionView = {
        let cVLayuot = UICollectionViewFlowLayout()
        cVLayuot.scrollDirection = .horizontal
        let cV = UICollectionView(frame: .zero, collectionViewLayout: cVLayuot)
        cV.translatesAutoresizingMaskIntoConstraints = false
        cV.contentInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        return cV
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = Colors.mainColor
                
//        activityIndicator.startAnimating()
        
        collectionView.register(CaruselCollectionViewCell.self, forCellWithReuseIdentifier: CaruselCollectionViewCell.reuseId)
        
        setupLayour()
                
//        fetchData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayour() {
        setupCollectionView()
        setupActivityIndicator()
    }
    
    private func setupCollectionView() {
        addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func setupActivityIndicator() {
        addSubview(activityIndicator)
        
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
//    func fetchData() {
//        networkService.fetchData(q: "", page: page) { [weak self] articles in
//            guard let self = self else { return }
//
//            DispatchQueue.main.async {
//                self.items += articles
//                self.activityIndicator.stopAnimating()
//                self.collectionView.reloadData()
//            }
//        }
//    }
}
