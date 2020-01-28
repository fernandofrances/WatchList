//
//  WatchListHeader.swift
//  WatchList
//
//  Created by Fernando Frances  on 27/01/2020.
//  Copyright © 2020 Fernando Frances . All rights reserved.
//

import UIKit

class WatchListHeader: UITableViewHeaderFooterView,  NibLoadableView , ReusableView {
    
    static let height: CGFloat = 70.0

    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(title: String) {
        titleLabel.text = title
    }

}
