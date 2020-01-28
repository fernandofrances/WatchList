//
//  WatchListPresenter.swift
//  WatchList
//
//  Created by Fernando Frances  on 27/01/2020.
//  Copyright © 2020 Fernando Frances . All rights reserved.
//

import Foundation
import UIKit

protocol WatchListsView: class {
    var title: String? { get set }

    func update()
    func setUp()
}

final class WatchListsPresenter {
    
    private let repository: WatchListsRepository
    private var results: [WatchList] = []
    var mappedResults: [WatchList] = []
    
    weak var view: WatchListsView?
    
    init(repository: WatchListsRepository) {
        self.repository = repository
    }
    
    func didLoad() {
        view?.title = "Watch Lists"
        view?.setUp()
        loadContent()
    }
    
    func orientationDidChange() {
        mappedResults = repository.mappedResultsForNewOrientation(results: results)
    }
    
}

private extension WatchListsPresenter {
    func loadContent() {
        repository.watchListPage(type: .media) { (watchListPage, error) in
            if let _ = error {
                // Display error alert
            } else {
                guard let watchListPage = watchListPage else { return }
                self.results = watchListPage.results
                self.mappedResults = self.repository.mappedResultsForNewOrientation(results: self.results)
                self.view?.update()
            }
        }
    }
}
