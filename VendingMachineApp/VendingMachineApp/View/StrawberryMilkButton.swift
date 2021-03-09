//
//  StrawberryMilkButton.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/03/08.
//

import Foundation

class StrawberryMilkButton: BeverageButtons {
    var strawberryMilk = BeverageFactory.shared.createBeverage(with: .strawberrymilk)
    
    override func action(completion: (Beverage) -> Void) {
        completion(strawberryMilk as! Beverage)
    }
}
