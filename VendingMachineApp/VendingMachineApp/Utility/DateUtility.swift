//
//  DateUtility.swift
//  VendingMachine
//
//  Created by TaeHyeonLee on 2017. 12. 11..
//  Copyright © 2017 ChocOZerO. All rights reserved.
//

import Foundation

extension Date {

    enum MilkExpirationInterval {
        case twoWeek

        var value: Double {
            switch self {
            case .twoWeek:
                return 60.0 * 60 * 24 * 7 * 2
            }
        }
    }

    func getStringFromDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.string(from: self)
    }

}
