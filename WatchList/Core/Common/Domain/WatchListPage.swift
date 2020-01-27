//
//  Page.swift
//  WatchList
//
//  Created by Fernando Frances  on 27/01/2020.
//  Copyright © 2020 Fernando Frances . All rights reserved.
//

import Foundation

struct WatchListPage {
    let results: [WatchList]
    
    private enum CodingKeys: String, CodingKey {
        case results = "WatchListTabs"
    }
}
