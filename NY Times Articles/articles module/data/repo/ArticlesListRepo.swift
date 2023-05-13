//
//  ArticlesListRepo.swift
//  NY Times Articles
//
//  Created by Azah mahgoub on 13/05/2023.
//

import Foundation
protocol ArticlesListRepo {
    func getArticlesList(dayNum: Int) async  -> Result<ArticlesListResponse, Error >
}
