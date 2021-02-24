//
//  DietCola.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class DietCola : Soda {
    private let taste : String
    
    init(brand: String, liter: Int, price: Int, name: String, manufactured: Date, sugar : Bool ,expiryDate: Date,hot : Bool, calory : Int, taste : String) {
        self.taste = taste
        super.init(brand: brand, liter: liter, price: price, name: name, manufactured: manufactured, sugar: sugar, expiryDate: expiryDate,hot : hot, calory : calory)
    }
    

}
