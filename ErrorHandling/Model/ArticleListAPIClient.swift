//
//  ArticleListAPIClient.swift
//  ErrorHandling
//
//  Created by 渡邊魁優 on 2023/03/25.
//

import Foundation

class ArticleListAPIClient {
    
    func fetchArticles() async throws -> [Article] {
        
        guard let url = URL(string: "https://qiita.com/api/v2/items") else {
            throw APIError.invalidURL
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return try JSONDecoder().decode([Article].self, from: data)
        } catch {
            throw APIError.networkError
        }
    }
}
