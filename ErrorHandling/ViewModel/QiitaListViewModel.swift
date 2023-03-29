//
//  QiitaListViewModel.swift
//  ErrorHandling
//
//  Created by 渡邊魁優 on 2023/03/25.
//

import Foundation

class QiitaListViewModel: ObservableObject {
    @Published var articlesList: [Article] = []
    let articlesAPIClient = ArticleListAPIClient()
    
    func onAppear() {
        Task {
            await loadArticles()
        }
    }
    
    @MainActor
    private func loadArticles() async {
        do {
            let articles = try await articlesAPIClient.fetchArticles()
            articlesList = articles
        } catch {
            let error = error as? APIError ?? APIError.unknown
            print(error.title)
        }
    }
}
