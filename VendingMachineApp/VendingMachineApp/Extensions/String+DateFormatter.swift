//
//  String+DateFormatter.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/03.
//

import Foundation

extension String {
    
    var formattedDate: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.date(from: self)
    }
}
