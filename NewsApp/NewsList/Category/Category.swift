//
//  Category.swift
//  NewsApp
//
//  Created by Admin on 24.11.2023.
//

import Foundation

enum Category: String, CaseIterable {
    case Bitcoin = "Bitcoin"
    case Google = "Google"
    case apple = "Apple"
    
    var displayTitle: String {
        switch self {
        case .Bitcoin:
            return "Биткоин"
        case .Google:
            return "Google"
        case .apple:
            return "Apple"
        }
    }
    
    var requestTitle: String {
        switch self {
        case .Bitcoin:
            return "bitcoin"
        case .Google:
            return "google"
        case .apple:
            return "apple"
        }
    }
}
