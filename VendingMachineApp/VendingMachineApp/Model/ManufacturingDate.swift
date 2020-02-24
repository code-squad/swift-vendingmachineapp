//
//  ManufacturingDate.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/24.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class ManufacturingDate {
    var date: Date
    
    init() {
        self.date = Date()
    }
}

extension ManufacturingDate: CustomStringConvertible {
    var description: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter.string(from: date)
    }
}
