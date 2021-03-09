//
//  TOPButton.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/03/08.
//

import Foundation

class TOPButton: BeverageButtons {
    var top = BeverageFactory.shared.createBeverage(with: .top)
    
    override func action(completion: (Beverage) -> Void) {
        completion(top as! Beverage)
    }
}
