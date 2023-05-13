//
//  URLList.swift
//  NY Times Articles
//
//  Created by Azah mahgoub on 14/05/2023.
//

import Foundation

struct URLList {
    static private let baseURl = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/"
    
    static func articleListUrl(for numofdays: Int) -> String {
        "\(baseURl)\(numofdays).json?api-key=\(Constants.apiKey)"
    }
}

