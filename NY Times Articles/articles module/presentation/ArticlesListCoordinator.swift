//
//  ArticlesListCoordinator.swift
//  NY Times Articles
//
//  Created by Azah mahgoub on 13/05/2023.
//

import UIKit

protocol ArticlesListCoordinatorProtocol {
    func start()
}

class ArticlesListCoordinator: ArticlesListCoordinatorProtocol {
    let navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let useCase = ArticlesListUseCase()
        let repo = ArticlesListRepoImpl()
        let viewModel = ArticlesListViewModel(coordinator: self, repo: repo, useCase: useCase)
        let viewController = ArticlesListViewController.init(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}
