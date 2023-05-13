//
//  ArticlesListViewController.swift
//  NY Times Articles
//
//  Created by Azah mahgoub on 13/05/2023.
//

import UIKit

class ArticlesListViewController: UIViewController {
    
    let viewModel: ArticlesListViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
    
    init(viewModel: ArticlesListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "ArticlesListViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
