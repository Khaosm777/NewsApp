//
//  Article.swift
//  NewsApp
//
//  Created by Admin on 14.11.2023.
//

import UIKit

struct Article: Equatable {
    let title: String
    let description: String
    let content: String
    let author: String
    let urlToImage: URL
    let url: URL
    let publishedAt: String?
}
