//
//  ExtendedDate.swift
//  VendingMachineApp
//
//  Created by delma on 2020/03/06.
//  Copyright © 2020 delma. All rights reserved.
//

import Foundation

extension Date {
    func dateToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.string(from: self)
    }
}
