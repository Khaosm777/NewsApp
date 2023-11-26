//
//  CategoryViewController.swift
//  NewsApp
//
//  Created by Admin on 23.11.2023.
//

import UIKit

protocol CategoryViewControllerDelegate: AnyObject {
    func doneButtonTapped(selectedCategory: Category)
}

class CategoryViewController: UIViewController {
    
    weak var delegate: CategoryViewControllerDelegate?
    
    let mainView = CategoryView()
    
    override func loadView() {
        view = mainView
    }
    
    init(selectedCategory: Category) {
        mainView.selectedItem = selectedCategory
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Категории"
                
        mainView.buttonDone.addTarget(self, action: #selector(tappedDone), for: .touchDown)
    }
    
    @objc
    func tappedDone() {
        dismiss(animated: true) { [weak self] in
            guard let self = self else { return }
            self.delegate?.doneButtonTapped(selectedCategory: self.mainView.selectedItem)
        }
    }
}
