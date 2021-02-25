//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/02/25.
//

import Foundation

class Beverage : CustomStringConvertible {
    
    private let brand : String
    private let volume : Int
    private let price : Int
    private let name : String
    private let manufactureddate : Date
    
    init(brand : String, volume : Int, price : Int, name: String, manufactureddate : Date){
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.manufactureddate = manufactureddate
    }
    
    var description: String {
        return "\(self.name)\(self.volume)\(self.price)\(self.brand)\(self.manufactureddate)"
    }
}
