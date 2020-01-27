//
//  WebServiceConfiguration.swift
//  WatchList
//
//  Created by Fernando Frances  on 27/01/2020.
//  Copyright © 2020 Fernando Frances . All rights reserved.
//

import Foundation

struct WebServiceConfiguration {
    let token: String
    static let `default` = WebServiceConfiguration(token: Bundle.main.object(forInfoDictionaryKey: "APP_TOKEN") as? String ?? "")
    
    var parameters: [String: String] {
        return ["token": token]
    }
}
