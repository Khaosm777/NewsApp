//
//  ImagesProvider.swift
//  NewsApp
//
//  Created by Admin on 14.11.2023.
//

import UIKit

final class ImagesProvider {
    
    private var images: [String: UIImage] = [:]
    
    func image(for url: URL) -> UIImage? {
        images[url.absoluteString] 
    }
    
    func image(for url: URL, completion: @escaping (UIImage?) -> Void) {
        if let image = images[url.absoluteString] {
            completion(image)
        }  else {
            fetchImage(url: url, completion: completion)
        }
    }
    
    private func fetchImage(url: URL, completion: @escaping (UIImage?) -> Void) {
        let urlRequest = URLRequest(url: url)
         
        URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let image = UIImage(data: data)
            
            self.images[url.absoluteString] = image
            
            completion(image)
        }.resume()
    }
}
