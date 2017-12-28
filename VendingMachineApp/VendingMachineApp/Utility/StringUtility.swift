//
//  StringUtility.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 11..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

extension String {

    func getDateFromString() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        let date = dateFormatter.date(from: self) ?? Date()
        return date
    }

}
