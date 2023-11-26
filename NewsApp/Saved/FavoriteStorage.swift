//
//  FavoriteStorage.swift
//  NewsApp
//
//  Created by Admin on 26.11.2023.
//
import Foundation

final class FavoriteStorage {
    
    static let notification = Notification.Name("FavoritesChaged")
    
    static let shared = FavoriteStorage()
    
    var items: [Article] = []
    
    func handle(_ element: Article) {
        if contains(element) {
            items.removeAll { $0 == element }
        } else {
            items.append(element)
        }
        
        NotificationCenter.default.post(name: Self.notification, object: nil)
    }
    
     func contains(_ element: Article) -> Bool {
        items.contains { $0 == element }
    }
}
