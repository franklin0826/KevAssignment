//
//  ArticleModel.swift
//  SamsTakeHome
//
//  Created by Franklin Mott on 8/3/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation



struct ArticleResponse: Decodable {
    let articles: [ArticleInfo]
}

struct ArticleInfo: Decodable {
    let author: String
    let title: String
    let description: String
    let urlToImage: String
    let content: String
    
}
