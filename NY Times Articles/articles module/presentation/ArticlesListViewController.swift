//
//  ArticlesListViewController.swift
//  NY Times Articles
//
//  Created by Azah mahgoub on 13/05/2023.
//

import UIKit

class ArticlesListViewController: UIViewController {
    
    @IBOutlet weak var articlesTableView: UITableView!
    let viewModel: ArticlesListViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        viewModel.bindScreenStatusToViewController = { [weak self] result in
            switch result {
            case .loading:
                self?.showLoader()
            case .sucsess:
                self?.articlesTableView.reloadData()
            case .failure(let error):
                self?.showError(error: error)
            }
            
        }
        viewModel.viewDidLoad()
        
    }
    
    private func showError(error: Error) {
        
    }
    
    private func showLoader() {
        
    }
    
    private func setupTableView() {
        articlesTableView.dataSource = self
        articlesTableView.delegate = self
        articlesTableView.rowHeight = UITableView.automaticDimension
        articlesTableView.register(UINib(nibName: ArticleTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ArticleTableViewCell.identifier)
    }
    
    init(viewModel: ArticlesListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "ArticlesListViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ArticlesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articlesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.identifier, for: indexPath) as! ArticleTableViewCell
        cell.configure(article: viewModel.articlesList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
