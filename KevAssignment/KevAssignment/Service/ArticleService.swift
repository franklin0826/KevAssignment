//
//  ArticleService.swift
//  KevAssignment
//
//  Created by Franklin Mott on 7/29/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation

typealias ArticleHandler = ([Article]) -> Void

class ArticleService {
    
    func getArticles(for search: String, completion: @escaping ArticleHandler) {
        
        guard let url = APIKEY.url else {
            completion([])
            return
        }
    }
     
}
