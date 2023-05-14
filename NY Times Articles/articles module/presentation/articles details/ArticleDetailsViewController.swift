//
//  ArticleDetailsViewController.swift
//  NY Times Articles
//
//  Created by Azah mahgoub on 14/05/2023.
//

import UIKit

class ArticleDetailsViewController: UIViewController {
    let viewModel: ArticleDetailsViewModel
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(viewModel: ArticleDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "ArticleDetailsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
    }
    
}
