//
//  Milk.swift
//  VendingMachineApp
//
//  Created by jinseo park on 3/17/21.
//

import Foundation


class Milk : Beverage  {
    
    enum MilkName : String, CustomStringConvertible {
        case Strawberry, Choco, Banana
        
        var description: String {
            switch self {
            case .Strawberry :
                return "딸기우유"
            case .Choco :
                return "초코우유"
            case .Banana :
                return "바나나우유"
            }
        }
    }
    
    init(_ brand : String , _ capacity : Int, _ price : Int, _ name : String, _ milkName : MilkName, _ dateOfManufacture : String) {
        super.init( brand, capacity, price, (name + milkName.description), dateOfManufacture)
    }
}
