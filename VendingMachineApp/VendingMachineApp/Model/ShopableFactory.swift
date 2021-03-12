//
//  BeverageFactory.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/03.
//

import Foundation

protocol ShopableFactory {

    func create(type: Shopable.Type) -> Shopable
    
    func createAll() -> [Shopable]

}

class BeverageToday: ShopableFactory {
    
    private let allTypes: [Beverage.Type] = [Americano.self, CafeLatte.self, Chocolate.self, Coke.self, Milkis.self, Plain.self]
    
    func create(type: Shopable.Type) -> Shopable {
        return type.init()
    }
    
    func createAll() -> [Shopable] {
        var beverages = [Shopable]()
        
        allTypes.forEach { (beverage) in
            beverages.append(create(type: beverage) )
        }
        return beverages
    }
}
