//
//  ArticlesListCoordinator.swift
//  NY Times Articles
//
//  Created by Azah mahgoub on 13/05/2023.
//

import UIKit

protocol ArticlesListCoordinatorProtocol {
    func start()
    func routToArticlesDetails(article: ArticleUIModel)
    
}

class ArticlesListCoordinator: ArticlesListCoordinatorProtocol {
    let navigationController: UINavigationController
    var viewController: ArticlesListViewController!
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let useCase = ArticlesListUseCase()
        let repo = ArticlesListRepoImpl(decoder: CustomDecoder())
        let viewModel = ArticlesListViewModel(coordinator: self, repo: repo, useCase: useCase)
        viewController = ArticlesListViewController.init(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func routToArticlesDetails(article: ArticleUIModel) {
        ArticleDetailsCoordinator.init(sourceViewController: navigationController).start(article: article)
    }
}
