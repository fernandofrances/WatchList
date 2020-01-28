//
//  String + Date.swift
//  WatchList
//
//  Created by Fernando Frances  on 27/01/2020.
//  Copyright © 2020 Fernando Frances . All rights reserved.
//

import Foundation

extension String {
    
    func formatTimeStamp() -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS'Z'"
        formatter.timeZone = .current
        guard let date = formatter.date(from: self) else { return nil }
        formatter.dateFormat = "EEEE, MMM d, yyyy"
        return formatter.string(from: date)
    }
    
}
