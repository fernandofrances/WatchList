//
//  Endpoint.swift
//  WatchList
//
//  Created by Fernando Frances  on 27/01/2020.
//  Copyright © 2020 Fernando Frances . All rights reserved.
//

import Foundation

enum Endpoint {
    case watchList(type: WatchListType)
}

extension Endpoint {
    func request(with baseURL: URL, adding parameters: [String: String]) -> URLRequest {
        let url = baseURL.appendingPathComponent(path)

        var newParameters = self.parameters
        parameters.forEach { newParameters.updateValue($1, forKey: $0) }

        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        components.queryItems = newParameters.map(URLQueryItem.init)

        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue

        return request
    }
}

private enum HTTPMethod: String {
    case get = "GET"
}

private extension Endpoint {
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        switch self {
        case .watchList:
            return "TabList.json"
        }
    }
    
    var parameters: [String: String] {
        switch self {
        case .watchList(let type):
            return ["alt": type.rawValue]
        }
    }
}
