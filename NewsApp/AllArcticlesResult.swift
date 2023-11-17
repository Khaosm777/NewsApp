//
//  AllArcticleResult.swift
//  NewsApp
//
//  Created by Admin on 09.11.2023.
//

struct AllArcticlesResult: Decodable {
    let status: String
    let totalResults: Int
    let articles: [ArticleResult]
}
