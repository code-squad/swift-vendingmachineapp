//
//  BeverageFactory.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/03.
//

import Foundation

protocol ShopableFactory {

    func create(type: Shopable.Type) -> Shopable

}

class BeverageToday: ShopableFactory {
    
    func create(type: Shopable.Type) -> Shopable {
        return type.init()
    }
}
