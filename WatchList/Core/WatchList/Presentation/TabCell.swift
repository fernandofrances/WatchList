//
//  TabCell.swift
//  WatchList
//
//  Created by Fernando Frances  on 27/01/2020.
//  Copyright © 2020 Fernando Frances . All rights reserved.
//

import UIKit

class TabCell: UITableViewCell, ReusableView, NibLoadableView {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    func configure(with tab: Tab) {
        nameLabel.text = tab.name
        idLabel.text = String(tab.id)
        dateLabel.text = tab.lastModified.toDateString()
    }
    
}
