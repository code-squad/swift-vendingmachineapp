//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by jinseo park on 3/17/21.
//

import Foundation

class Beverage : CustomStringConvertible {
    var description: String {
        return "\(self.brand) , \(self.capacity), \(self.price), \(self.name), \(self.dateOfManufacture)"
    }
    
    private var brand : String
    private var capacity : Int
    private var price : Int
    private var name : String
    private var dateOfManufacture : String
    
    init(_ brand : String, _ capacity : Int, _ price : Int, _ name : String, _ dateOfManufacture : String) {
        self.brand = brand //
        self.capacity = capacity
        self.price = price
        self.name = name
        self.dateOfManufacture = dateOfManufacture
    }
   
}
