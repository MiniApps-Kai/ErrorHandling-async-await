//
//  ArticleModel.swift
//  ErrorHandling
//
//  Created by 渡邊魁優 on 2023/03/25.
//

import Foundation

struct Article: Decodable, Identifiable {
    let title: String
    
    var id: String { title }
}
