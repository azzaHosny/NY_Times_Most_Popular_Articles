//
//  ArticlesListViewModel.swift
//  NY Times Articles
//
//  Created by Azah mahgoub on 13/05/2023.
//

import Foundation
class ArticlesListViewModel {
    let coordinator: ArticlesListCoordinatorProtocol
    let repo: ArticlesListRepo
    let useCase: ArticlesListUseCaseProtocol
    
    init(coordinator: ArticlesListCoordinatorProtocol, repo: ArticlesListRepo, useCase: ArticlesListUseCaseProtocol) {
        self.coordinator = coordinator
        self.repo = repo
        self.useCase = useCase
        
    }
}
