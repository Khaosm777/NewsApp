//
//  ProductListNetworkService.swift
//  NewsApp
//
//  Created by Admin on 08.11.2023.
//

//ea2d8b2408b447209b36ef5747df12e2

import Foundation

final class ArticleListNetworkService {
    
    func fetchData(
        q: String,
        page: Int,
        completion: @escaping ([Article]) -> Void
    ) {
        let urlString = urlString(q: q, page: page)
        
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
            
            let arcticles = self.convert(from: result.articles)
                        
            completion(arcticles)
        }.resume()
    }
    
    private func urlString(q: String?, page: Int) -> String {
        var baseString = "https://newsapi.org/v2/everything?sortBy=popularity&apiKey=ea2d8b2408b447209b36ef5747df12e2&language=ru"
        
        if let q = q {
            baseString += "&q=\(q)"
        }
        
        baseString += "&page=\(page)"
        
        return baseString
    }
    
    private func convert(from result: [ArticleResult]) -> [Article] {
        var arcticles: [Article] = []
        
        for item in result {
            if let title = item.title,
               let description = item.description,
               let author = item.author,
               let urlToImage = item.urlToImage,
               let url = item.url,
               let publishedAt = item.publishedAt,
               let content = item.content
            {
                arcticles.append(Article(title: title, description: description,content: content, author: author, urlToImage: urlToImage, url: url, publishedAt: publishedAt ))
            }
        }
        return arcticles
    }
}
