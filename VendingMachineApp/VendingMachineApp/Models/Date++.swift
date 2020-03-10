//
//  Date++.swift
//  VendingMachineApp
//
//  Created by Cloud on 2020/03/10.
//  Copyright © 2020 Cloud. All rights reserved.
//

import Foundation

extension Date {
    func customDateFormatToString(format: String) -> String {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
