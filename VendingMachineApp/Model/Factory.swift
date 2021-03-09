//
//  Factory.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/09.
//

import Foundation

protocol FactoryPattern {
    static func createInstance(type value : Beverage.Type) -> Beverage?
}

class Factory : FactoryPattern {
    static func createInstance(type value : Beverage.Type) -> Beverage? {
        return value.init()
    }
}
