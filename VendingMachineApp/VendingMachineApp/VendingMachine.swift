//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/24.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class VendingMachine{
    var beverages: Beverages
    
    init(){
        beverages = Beverages()
    }
    
    func convertDate(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.string(from: date)
    }
    
    func printBeverages(){
        beverages.forEachBeverages{
            print("\($0), \(convertDate(date: $0.date()))")
        }
    }
}
