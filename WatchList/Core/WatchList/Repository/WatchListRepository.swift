//
//  WatchListRepository.swift
//  WatchList
//
//  Created by Fernando Frances  on 27/01/2020.
//  Copyright © 2020 Fernando Frances . All rights reserved.
//

import UIKit
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
    
    func mappedResultsForNewOrientation(results: [WatchList]) -> [WatchList] {
        if UIDevice.current.orientation.isLandscape {
            return results
                .map { WatchList(id: $0.id, title: $0.title, tabs: $0.tabs.filter { $0.id % 2 == 0 } ) }
                .filter { $0.tabs.count != 0 }
        } else {
            return results
        }
    }
}
