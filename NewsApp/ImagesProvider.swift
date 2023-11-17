//
//  ImagesProvider.swift
//  NewsApp
//
//  Created by Admin on 14.11.2023.
//

import UIKit

final class ImagesProvider {
    
    private var images: [String: UIImage] = [:]
    
    func prefetchImages(urls: [URL]) {
        for url in urls {
          fetchImage(url: url)
        }
    }
    
    func image(for url: URL) -> UIImage {
        images[url.absoluteString] ?? UIImage()
    }
    
    private func fetchImage(url: URL) {
        let urlRequest = URLRequest(url: url)
         
        URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else { return }
            
            let image = UIImage(data: data)
            
            self.images[url.absoluteString] = image ?? UIImage()
            
            print(1)
        }.resume()
    }
}
