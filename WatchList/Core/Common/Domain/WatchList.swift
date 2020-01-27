//
//  File.swift
//  WatchList
//
//  Created by Fernando Frances  on 27/01/2020.
//  Copyright © 2020 Fernando Frances . All rights reserved.
//

import Foundation


struct WatchList: Decodable {
    let id: Int
    let title: String
    let tabs: [Tab]
    
    private enum CodingKeys: String, CodingKey {
        case id = "Id"
        case title = "Title"
        case tabs = "Tabs"
    }
}
