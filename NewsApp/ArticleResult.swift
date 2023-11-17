//
//  Article.swift
//  NewsApp
//
//  Created by Admin on 06.11.2023.
//

import UIKit

struct ArticleResult: Decodable {
    let author: String?
    let title: String?
    let description: String?
    let content: String?
    let urlToImage: URL?
    let url: URL?
}
