//
//  MyNewsViewController.swift
//  NewsApp
//
//  Created by Admin on 06.11.2023.
//

import UIKit

class MyNewsViewController: UIViewController {
    
    let newView = MyNewsView()
    
    override func loadView() {
        view.self = newView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Мои новости"

    }
}
