//
//  NetworkManager.swift
//  NY Times Articles
//
//  Created by Azah mahgoub on 13/05/2023.
//

import Foundation

class NetworkManager {
    
    func makeRequest<T: Codable>(type: T.Type, httpMethod: String, url: String, postParameters: [String: Any]? , decoder:  CustomDecoderProtocol) async throws -> Result<T,Error>  {
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: nil)
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = httpMethod
        do {
            let result = try await session.data(for: request)
            let data = try decoder.decode(type, from: result.0)
            return .success(data)
        } catch {
            return .failure(error )
        }
    }
}
