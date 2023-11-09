//
//  ProductListNetworkService.swift
//  NewsApp
//
//  Created by Admin on 08.11.2023.
//

//ea2d8b2408b447209b36ef5747df12e2

import Foundation

final class ArticleListNetworkService {
    
    private var page = 1
    
    private var urlString: String { "https://newsapi.org/v2/everything?q=tesla&from=2023-10-09&sortBy=publishedAt&apiKey=ea2d8b2408b447209b36ef5747df12e2&language=ru&page=\(page)"
    }
    
    func fetchData(page: Int, completion: @escaping ([Article]) -> Void) {
        self.page = page
        
        guard let url = URL(string: urlString) else { return }
        
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else {
                print("No data")
                return
            }
            
            guard let result = try? JSONDecoder().decode(AllArcticlesResult.self, from: data) else {
                print("Can not decode data")
                return
            }
            
            completion(result.articles)
        }.resume()
        
        
    }
}
