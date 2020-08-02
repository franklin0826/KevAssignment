//
//  ArticleModel.swift
//  KevAssignment
//
//  Created by Franklin Mott on 7/29/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation

struct ArticleResponse: Decodable {
    let articles: [Article]
}

class Article: Decodable {
    let author: String
    let title: String
    let description: String
    let urlToImage: String
    let content: String
    
}
