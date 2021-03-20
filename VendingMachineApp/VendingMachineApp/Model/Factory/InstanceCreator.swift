//
//  Factory.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/12.
//

import Foundation

<<<<<<< HEAD
class InstanceCreator {
    
    static func createInstance(sku: Beverage.Type) -> Beverage? {
=======
class Factory {
    
    static func insertBeverage(sku: Beverage.Type) -> Beverage {
>>>>>>> b60d271d... 구매와 관련이 있는 뷰입니다.
        return sku.init()
    }
    
}
