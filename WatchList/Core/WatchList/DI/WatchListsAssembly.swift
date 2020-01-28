//
//  WatchListAssembly.swift
//  WatchList
//
//  Created by Fernando Frances  on 28/01/2020.
//  Copyright © 2020 Fernando Frances . All rights reserved.
//

import Foundation

final class WatchListsAssembly {
    
    private let webService: WebService
    
    init(webService: WebService) {
        self.webService = webService
    }
    
    func viewController() -> WatchListsViewController {
        return WatchListsViewController(presenter: presenter())
    }
    
    private func presenter() -> WatchListsPresenter {
        return WatchListsPresenter(repository: repository())
    }
    
    private func repository() -> WatchListsRepository {
        return WatchListsRepository(webService: webService)
    }
}
