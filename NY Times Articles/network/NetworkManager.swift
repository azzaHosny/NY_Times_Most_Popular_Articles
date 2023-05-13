//
//  NetworkManager.swift
//  NY Times Articles
//
//  Created by Azah mahgoub on 13/05/2023.
//

import Foundation


class NetworkManager {
    
    func makeRequest(httpMethod: String, url: String, postParameters: [String: Any]? ) async -> (data: Data, urlResponse: URLResponse)  {
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: nil)
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = httpMethod
//        request.httpBody = try! JSONSerialization.data(withJSONObject: [], options: .prettyPrinted)
        
        let result = try! await session.data(for: request)
        return result
    }
}
