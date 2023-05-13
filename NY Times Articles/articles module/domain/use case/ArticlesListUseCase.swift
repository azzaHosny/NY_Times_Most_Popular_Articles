//
//  GetArticlesList.swift
//  NY Times Articles
//
//  Created by Azah mahgoub on 13/05/2023.
//

import Foundation
protocol ArticlesListUseCaseProtocol {
    func buildArticlesList(repo: ArticlesListRepo, dayNum: ValidPeriod)async -> Result<[ArticleUIModel], Error>
}

enum ValidPeriod: Int {
    case one = 1
    case seven = 7
    case thirty = 30
}
class ArticlesListUseCase: ArticlesListUseCaseProtocol {
    
    func buildArticlesList(repo: ArticlesListRepo, dayNum: ValidPeriod) async -> Result<[ArticleUIModel], Error> {
        let result = await repo.getArticlesList(dayNum: dayNum.rawValue)
        switch result {
        case .success(let articleRespons):
            return .success(Adapter.transfer(response: articleRespons))
        case .failure(let error):
            return .failure(error)
        }
    }
    
}

class Adapter {
    class func transfer(response: ArticlesListResponse) -> [ArticleUIModel] {
        response.results?
            .map({
                ArticleUIModel(title: $0.title ?? "",
                               abstract: $0.abstract ?? "",
                               publishedDate: $0.published_date ?? "",
                               byline: $0.byline ?? "",
                               articleUrl: $0.url ?? "",
                               section:  $0.section ?? "")}) ?? []
    }
}
