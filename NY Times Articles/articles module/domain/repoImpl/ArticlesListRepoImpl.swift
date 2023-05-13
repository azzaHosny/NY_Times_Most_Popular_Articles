//
//  ArticlesListRepoImpl.swift
//  NY Times Articles
//
//  Created by Azah mahgoub on 13/05/2023.
//

import Foundation
class ArticlesListRepoImpl: ArticlesListRepo {
    
    let decoder: CustomDecoderProtocol
    init(decoder: CustomDecoderProtocol) {
        self.decoder = decoder
    }
    
    func getArticlesList(dayNum: Int) async  -> Result<ArticlesListResponse, Error > {
        
        do {
            let respone = try await NetworkManager().makeRequest(type: ArticlesListResponse.self, httpMethod: "GET", url: URLList.articleListUrl(for: dayNum), postParameters: nil, decoder: decoder)
            return respone
        } catch {
            return .failure(error)
        }
    }
    
}

protocol CustomDecoderProtocol {
    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable
}

class CustomDecoder: CustomDecoderProtocol {
    func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable {
        try JSONDecoder().decode(type, from: data)
    }
}
