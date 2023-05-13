//
//  GetArticlesList.swift
//  NY Times Articles
//
//  Created by Azah mahgoub on 13/05/2023.
//

import Foundation
protocol ArticlesListUseCaseProtocol {
    func buildArticlesList(repo: ArticlesListRepo, dayNum: Int)async -> Result<[ArticleUIModel], Error>
}

class ArticlesListUseCase: ArticlesListUseCaseProtocol {

    func buildArticlesList(repo: ArticlesListRepo, dayNum: Int) async -> Result<[ArticleUIModel], Error> {
        let result = await repo.getArticlesList(dayNum: dayNum)
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
        response.results?.map({ArticleUIModel(title: $0.title ?? "")}) ?? []
    }
}
