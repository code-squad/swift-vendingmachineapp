//
//  Soda.swift
//  VendingMachineApp
//
//  Created by jinseo park on 3/17/21.
//

import Foundation

class Soda : Beverage  {
    enum SodaName : String, CustomStringConvertible {
        case Coke, Sprite, Fanta
        
        var description: String {
            switch self {
            case .Coke :
                return "콜라"
            case .Sprite :
                return "사이다"
            case .Fanta :
                return "환타"
            }
        }
    }
    
    init(_ brand : String , _ capacity : Int, _ price : Int, _ name : String, _ sodaName : SodaName, _ dateOfManufacture : String) {
        super.init( brand, capacity, price, (name + sodaName.description), dateOfManufacture)
    }
}
