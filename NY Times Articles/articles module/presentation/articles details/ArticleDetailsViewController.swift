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
        setupView()
    }
    
    @IBOutlet weak var articleUrlLabel: UILabel!
    @IBOutlet weak var abstarctLabel: UILabel!
    @IBOutlet weak var writerNameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    init(viewModel: ArticleDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "ArticleDetailsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        writerNameLabel.text = viewModel.article.byline
        titleLabel.text = viewModel.article.title
        abstarctLabel.text = viewModel.article.abstract
        articleUrlLabel.text = viewModel.article.articleUrl
    }
    
}
