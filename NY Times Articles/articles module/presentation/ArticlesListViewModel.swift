//
//  ArticlesListViewModel.swift
//  NY Times Articles
//
//  Created by Azah mahgoub on 13/05/2023.
//

import Foundation
class ArticlesListViewModel {
    var articlesList: [ArticleUIModel] = []
    let coordinator: ArticlesListCoordinatorProtocol
    let repo: ArticlesListRepo
    let useCase: ArticlesListUseCaseProtocol
    
    init(coordinator: ArticlesListCoordinatorProtocol, repo: ArticlesListRepo, useCase: ArticlesListUseCaseProtocol) {
        self.coordinator = coordinator
        self.repo = repo
        self.useCase = useCase
    }
    
    func viewDidLoad()  {
        Task {
           let result = await useCase.buildArticlesList(repo: repo, dayNum: 6)
            switch result {
            case .success(let list):
                await MainActor.run {
                    articlesList = list
                }
            case .failure(let failure):
                break
            }
        }
    }
}
