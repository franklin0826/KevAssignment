//
//  Service.swift
//  SamsTakeHome
//
//  Created by Franklin Mott on 8/3/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation

class ArticleService {
    
    let url = URL(string: "http://newsapi.org/v2/everything?q=bitcoin&from=2020-07-02&sortBy=publishedAt&apiKey=144ed5cdfe994830897159c56f275d82")
    func getArticles() {
        URLSession.shared.dataTask(with: url!) { (dat, resp, err) in
            guard let error = err else {
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
            print(response)
        }.resume()
    }
}
