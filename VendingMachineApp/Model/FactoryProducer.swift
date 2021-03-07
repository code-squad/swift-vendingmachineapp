//
//  BeverageFactory.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/27.
//

import Foundation

protocol BeverageFactory {
    func createBeverage<T>(type value : T) -> Beverage?
}

class FactoryProducer {
    static func getFactory(type value : Beverage.Type) -> BeverageFactory? {
        switch value {
        case is Coffee.Type : return CoffeeFactory()
        case is Soda.Type : return SodaFactory()
        case is Milk.Type : return MilkFactory()
        case is EnergyDrink.Type : return EnergyDrinkFactory()
        default:
            return nil
        }
    }
}
