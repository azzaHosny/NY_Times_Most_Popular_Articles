//
//  ArticlesListRepoImpl.swift
//  NY Times Articles
//
//  Created by Azah mahgoub on 13/05/2023.
//

import Foundation
class ArticlesListRepoImpl: ArticlesListRepo {
    
    func getArticlesList(dayNum: Int) async  -> Result<ArticlesListResponse, Error > {
        let url = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=JfVCj6yvsSiKV2u284LDARisa5mTXyFf"
        let respone =  await NetworkManager().makeRequest(httpMethod: "GET", url: url, postParameters: [:])
        do {
            let articlesListResult = try JSONDecoder().decode(ArticlesListResponse.self, from: respone.data)
            return.success(articlesListResult)
        } catch {
            return .failure(error)
        }
       
    }
    
}
