//
//  WatchListsViewController.swift
//  WatchList
//
//  Created by Fernando Frances  on 27/01/2020.
//  Copyright © 2020 Fernando Frances . All rights reserved.
//

import UIKit

class WatchListsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    private let presenter: WatchListsPresenter
    
    init(presenter: WatchListsPresenter) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        presenter.view = self
        presenter.didLoad()
    }
    
    override func willTransition(to newCollection: UITraitCollection,
                                 with coordinator: UIViewControllerTransitionCoordinator) {
        presenter.mapResultsDependingOnOrientation()
        tableView.reloadData()
    }

}

extension WatchListsViewController: WatchListsView {
    
    func setUp() {
        tableView.register(TabCell.self)
        tableView.register(WatchListHeader.self)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionHeaderHeight = WatchListHeader.height
    }
    
    func update() {
        DispatchQueue.main.async {
            self.loader.stopAnimating()
            self.tableView.reloadData()
        }
    }
}

extension WatchListsViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.mappedResults.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header: WatchListHeader = tableView.dequeueReusableHeaderFooterView(withIdentifier: WatchListHeader.defaultReuseIdentifier) as? WatchListHeader else { return nil }
        header.configure(title: presenter.mappedResults[section].title)
        return header
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.mappedResults[section].tabs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(TabCell.self)
        cell.configure(with: presenter.mappedResults[indexPath.section].tabs[indexPath.row])
        return cell
    }
    
}
