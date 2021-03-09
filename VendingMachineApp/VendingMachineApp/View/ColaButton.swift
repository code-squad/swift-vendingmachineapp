//
//  ColaButton.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/03/08.
//

import Foundation

class ColaButton: BeverageButtons {
    var cola = BeverageFactory.shared.createBeverage(with: .cola)
    
    override func action(completion: (Beverage) -> Void) {
        completion(cola as! Beverage)
    }
}
