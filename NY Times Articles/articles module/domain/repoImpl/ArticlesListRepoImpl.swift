//
//  ArticlesListRepoImpl.swift
//  NY Times Articles
//
//  Created by Azah mahgoub on 13/05/2023.
//

import Foundation
class ArticlesListRepoImpl: ArticlesListRepo {
    
    func getArticlesList(dayNum: Int) async  -> Result<ArticlesListResponse, Error > {
        let respone =  await NetworkManager().makeRequest(httpMethod: "GET", url: URLList.articleListUrl(for: dayNum), postParameters: nil)
        do {
            let articlesListResult = try JSONDecoder().decode(ArticlesListResponse.self, from: respone.data)
            return.success(articlesListResult)
        } catch {
            return .failure(error)
        }
       
    }
    
}
