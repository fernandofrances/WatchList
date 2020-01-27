//
//  WebService.swift
//  WatchList
//
//  Created by Fernando Frances  on 27/01/2020.
//  Copyright © 2020 Fernando Frances . All rights reserved.
//

import Foundation

enum WebServiceError: Error {
    case badStatus(Int)
    case api(String)
    case decoding
}

final class WebService {
    
    private let configuration: WebServiceConfiguration
    private let session = URLSession(configuration: .default)
    private let baseURL = URL(string: "https://firebasestorage.googleapis.com/v0/b/testtask01-c5746.appspot.com/o")
    private let decoder = JSONDecoder()
    
    init(configuration: WebServiceConfiguration) {
        self.configuration = configuration
    }
    
    func load<T: Decodable>(_ type: T.Type, from endpoint: Endpoint, completion: @escaping (T?, WebServiceError?) -> Void) {
        guard let url = self.baseURL else { return }
        let request = endpoint.request(with: url, adding: configuration.parameters)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            if let _ = error {
                completion(nil, .api("Error"))
            } else {
                guard let httpResponse = response as? HTTPURLResponse else {
                    fatalError("Unsupported protocol")
                }
                
                if 200 ..< 300 ~= httpResponse.statusCode {
                    if let data = data {
                        
                        do {
                            let object = try self.decoder.decode(T.self, from: data)
                            completion(object, nil)
                        } catch {
                            completion(nil, .decoding)
                        }
                        
                    } else {
                        completion(nil, .badStatus(httpResponse.statusCode))
                    }
                } else {
                    completion(nil, .api("Api Error"))
                }
            }
        }
        
        task.resume()
    }
    
}


