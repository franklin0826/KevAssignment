//
//  ViewModel.swift
//  SamsTakeHome
//
//  Created by Franklin Mott on 8/7/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation

class ViewModel {
    var searchText: String = ""
    let articles: [Article] = []
    
    let url = URL(string: "http://newsapi.org/v2/everything?q=(SearchText)&from=2020-07-02&sortBy=publishedAt&apiKey=144ed5cdfe994830897159c56f275d82")
    func articlesRetrieved(articles: ArticleResponse) {
        // return articles to empty array in main view controller here
        
    }
    
    //TODO: pass search text from searchbar to url
    

    func getArticles() {
        URLSession.shared.dataTask(with: url!) { (dat, resp, err) in
            guard err != nil else {
                print("no error retrieved")
                return
            }
            guard let data = dat else {
                print("data not retrieved")
                return
            }
            guard let articles = try? JSONDecoder().decode(ArticleResponse.self, from: data) else {
                return
            }
            print(articles)
            guard let response = resp else {
                print("response not found")
                return
            }
            //TODO: add response to table articles array
            print(response)
        }.resume()
    }
}
/* */
