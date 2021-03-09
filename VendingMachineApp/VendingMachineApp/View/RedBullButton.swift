//
//  RedBullButton.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/03/08.
//

import Foundation

class RedBullButton: BeverageButtons {
    var redbull = BeverageFactory.shared.createBeverage(with: .redbull)
    
    override func action(completion: (Beverage) -> Void) {
        completion(redbull as! Beverage)
    }
}
