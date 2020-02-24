//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/24.
//  Copyright © 2020 신한섭. All rights reserved.
//

import Foundation

class VendingMachine{
    private var beverages: Beverages
    
    init(){
        beverages = Beverages()
    }
    
    func insertBeverage(beverage: Beverage){
        beverages.addBeverage(beverage: beverage)
    }
    
    func forEachBeverages(_ transfrom: (Beverage) -> ()){
        beverages.forEachBeverages{
            transfrom($0)
        }
    }
}
