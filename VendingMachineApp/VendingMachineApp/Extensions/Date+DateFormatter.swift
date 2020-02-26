//
//  Date+extentions.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/25.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

extension Date {
    func dateFormatString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
}
