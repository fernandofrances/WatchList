//
//  WatchListRepository.swift
//  WatchList
//
//  Created by Fernando Frances  on 27/01/2020.
//  Copyright © 2020 Fernando Frances . All rights reserved.
//

import Foundation

final class WatchListsRepository {
    
    private let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func watchListPage(type: WatchListType, completion: @escaping (WatchListPage?, Error?) -> Void) {
        webService.load(WatchListPage.self, from: .watchList(type: type)) { (watchListPage, error) in
            if let error = error {
                print(error)
            } else {
                completion(watchListPage, nil)
            }
        }
    }
}
