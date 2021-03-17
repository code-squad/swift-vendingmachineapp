//
//  Coffee.swift
//  VendingMachineApp
//
//  Created by jinseo park on 3/17/21.
//

import Foundation

class Coffee : Beverage  {
    enum CoffeeName : String, CustomStringConvertible {
        case Americano, Latte, Macchiato
        
        var description: String {
            switch self {
            case .Americano :
                return "아메리카노"
            case .Latte :
                return "라떼"
            case .Macchiato :
                return "마끼아또"
            }
        }
    }
    
    init(_ brand : String , _ capacity : Int, _ price : Int, _ name : String, _ coffeeName : CoffeeName, _ dateOfManufacture : String) {
        super.init( brand, capacity, price, (name + coffeeName.description), dateOfManufacture)
    }
}
