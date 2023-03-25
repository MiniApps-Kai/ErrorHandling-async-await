//
//  ContentView.swift
//  ErrorHandling
//
//  Created by 渡邊魁優 on 2023/03/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var qiitaListViewModel = QiitaListViewModel()
    var body: some View {
        List(qiitaListViewModel.articlesList) { article in
            Text(article.title)
        }
        .onAppear(perform: qiitaListViewModel.onAppear)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
