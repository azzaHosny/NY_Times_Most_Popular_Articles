//
//  ArticlesTests.swift
//  ArticlesTests
//
//  Created by Azah mahgoub on 14/05/2023.
//

import XCTest
import NY_Times_Articles

final class ArticlesTests: XCTestCase {
    
  
    func test_getArticleswhenPassValidPeriodAndSuccess() async {
        let repo = MockArticlesRepo()
        let useCase = ArticlesListUseCase()
        let viewModel = ArticlesListViewModel(coordinator: MockCoordinator(), repo: repo, useCase: useCase)
        await viewModel.viewDidLoad()
        XCTAssert(viewModel.articlesList.count == 1)
        XCTAssert(viewModel.errorSescription == nil)

    }
    
    func test_getArticleswhenPassValidPeriodAndFailed() async {
        let repo = MockArticlesRepo(isNetworkFailureu: true)
        let useCase = ArticlesListUseCase()
        let viewModel = ArticlesListViewModel(coordinator: MockCoordinator(), repo: repo, useCase: useCase)
        await viewModel.viewDidLoad()
        XCTAssert(viewModel.articlesList.count == 0)
        XCTAssert(viewModel.errorSescription != nil)

    }
    
}

fileprivate class MockArticlesRepo: ArticlesListRepo {
    let isNetworkFailureu: Bool
    init(isNetworkFailureu: Bool = false) {
        self.isNetworkFailureu = isNetworkFailureu
    }
    func getArticlesList(dayNum: Int) async -> Result<ArticlesListResponse, Error> {
        if !isNetworkFailureu {
            return .success(ArticlesListResponse(status: "OK", copyright: "Copyright (c) 2023 The New York Times Company.  All Rights Reserved.", num_results: 20, results:
                                                    [Results(uri: "nyt://article/32478053-e11c-5eca-b231-260c3f64686c",
                                                             url: "https://www.nytimes.com/2023/05/08/opinion/timothy-mcveigh-mass-shootings.html",
                                                             id: 100000008897125,
                                                             asset_id: 100000008897125,
                                                             source: "New York Times",
                                                             published_date: "2023-05-08",
                                                             updated: "2023-05-09 16:07:50",
                                                             section: "Opinion",
                                                             subsection: "",
                                                             nytdsection: "opinion",
                                                             adx_keywords: "Gun Control;Terrorism;Right-Wing Extremism and Alt-Right;Mass Shootings;Mcveigh, Timothy James;Toobin, Jeffrey;Republican Party;Oklahoma City (Okla)",
                                                             column: nil,
                                                             byline: "By Michelle Goldberg",
                                                             type: "Article",
                                                             title: "Timothy McVeigh’s Dreams Are Coming True",
                                                             abstract: "Republican gun fetishism has forced us to normalize mass shootings.",
                                                             des_facet: [],
                                                             org_facet: [],
                                                             per_facet: [],
                                                             geo_facet: [],
                                                             media: [],
                                                             eta_id: 0)]))
        } else {
            return .failure(NetworkError.connectionError)
        }
    }
    
    
}

class MockCoordinator: ArticlesListCoordinatorProtocol {
    func routToArticlesDetails(article: ArticleUIModel) {
        
    }
    
    func start() {
        
    }
    
    
}

enum NetworkError: Error {
    case connectionError
}
