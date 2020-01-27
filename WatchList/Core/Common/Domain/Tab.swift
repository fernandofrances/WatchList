//
//  Tab.swift
//  WatchList
//
//  Created by Fernando Frances  on 27/01/2020.
//  Copyright © 2020 Fernando Frances . All rights reserved.
//

import Foundation

struct Tab: Decodable {
    let id: Int
    let name: String
    let lastModified: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "TabId"
        case name = "TabName"
        case lastModified = "LastModified"
    }
    
}
