//
//  CaruselNewsListViewController.swift
//  NewsApp
//
//  Created by Admin on 20.11.2023.
//

import UIKit

class CaruselNewsListViewController: UIViewController {
    
    let mainView = CaruselNewsListView()
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: nil, action: nil)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: TaBarView())
        
        mainView.collectionView.delegate = self
    }
}

extension CaruselNewsListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: collectionView.bounds.size.width - 100, height: collectionView.bounds.size.height - 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = mainView.items[indexPath.item]
        let image = mainView.imagesProvider.image(for: item.urlToImage)
        let vc = NewsInfoViewController(item: item, image: image ?? UIImage())

        navigationController?.pushViewController(vc, animated: true)
    }
}

