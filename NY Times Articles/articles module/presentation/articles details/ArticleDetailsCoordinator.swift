//
//  ArticlesDetailsCoordinator.swift
//  NY Times Articles
//
//  Created by Azah mahgoub on 14/05/2023.
//

import Foundation
import UIKit

protocol ArticleDetailsCoordinatorProtocol {
    func start(article: ArticleUIModel)
}

class ArticleDetailsCoordinator: ArticleDetailsCoordinatorProtocol {
    let sourceViewController: UINavigationController
    init(sourceViewController: UINavigationController) {
        self.sourceViewController = sourceViewController
    }
    func start(article: ArticleUIModel) {
        let viewModel = ArticleDetailsViewModel(article: article)
        let detailsViewController = ArticleDetailsViewController(viewModel: viewModel)
        sourceViewController.pushViewController(detailsViewController, animated: true)
    }
}
