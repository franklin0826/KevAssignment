//
//  ArticleRequest.swift
//  SamsTakeHome
//
//  Created by Franklin Mott on 8/10/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation

struct ArticleRequest {
    let articleUrl:URL
    let API_KEY = "144ed5cdfe994830897159c56f275d82"
    
    init(searchArt: String) {
        
        let urlString = "https://newsapi.org/v2/everything?q=\(searchArt)&from=2020-07-02&sortBy=publishedAt&apiKey=\(API_KEY)"
        guard let articleUrl = URL(string: urlString) else {fatalError()}
        self.articleUrl = articleUrl
    }

    func getArticles (completion: @escaping(Result<[ArticleInfo], Error>) -> Void) {
        URLSession.shared.dataTask(with: articleUrl){ (dat, resp, err) in
            guard let data = dat else {
            print("data not retrieved")
            return
            }
            
            do {
                let decoder = JSONDecoder()
                let articleResponse = try decoder.decode(ArticleResponse.self , from: data)
                let articleDetails = articleResponse.articles
            } catch {
                print("Error decoding data")
            }
            guard let response = resp else {
                print("response not found")
                return
            }
        //TODO: add response to table articles array
        print(response)
        }.resume()
    }
}
