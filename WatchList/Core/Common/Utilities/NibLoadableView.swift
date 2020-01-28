//
//  NibLoadableView.swift
//  WatchList
//
//  Created by Fernando Frances  on 27/01/2020.
//  Copyright © 2020 Fernando Frances . All rights reserved.
//

import UIKit

protocol NibLoadableView: class {
    static var nibName: String { get }
    static func instantiate() -> Self
}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }

    static func instantiate() -> Self {
        return UINib(nibName: nibName, bundle: Bundle(for: Self.self))
            .instantiate(withOwner: nil, options: nil).first as! Self
    }
}
