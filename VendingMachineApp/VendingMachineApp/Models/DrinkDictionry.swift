//
//  DrinkList.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/26.
//

import Foundation

class DrinksDictionary {
    private (set) var drinkDictionary: Dictionary<Drink, Int>
    
    init(){
        drinkDictionary = [:]
    }
    
    func append(_ drink: Drink) {
        guard var stock = drinkDictionary[drink] else {
            drinkDictionary[drink] = 1
            return
        }
        stock += 1
    }
}
