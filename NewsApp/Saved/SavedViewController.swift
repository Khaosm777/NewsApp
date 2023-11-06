//
//  SavedViewController.swift
//  NewsApp
//
//  Created by Admin on 06.11.2023.
//

import UIKit

class SavedViewController: UIViewController {
    
    let newView = SavedView()
    
    override func loadView() {
        view.self = newView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Сохраненные"

    }
}
