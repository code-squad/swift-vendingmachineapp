//
//  StringUtility.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/25.
//

import Foundation

extension String {
    func toDate() -> Date{
        let dateFormatter = Date.setDateFormat(with: "yyyyMMdd")
        let date = dateFormatter.date(from: self) ?? Date()
        return date
    }
}
