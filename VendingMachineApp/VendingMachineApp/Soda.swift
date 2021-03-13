//
//  Soda.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/02/27.
//

import Foundation

class Soda : Beverage {
    private var sugarContent : Int
    
    init(sugarContent : Int, brand : String, volume : Int, price : Int, name : String, manufactured : Date, temperature : Int, kcal : Int) {
        self.sugarContent = sugarContent
        super.init(brand: brand, volume: volume, price: price, name: name, manufactured: manufactured,temperature: temperature, kcal: kcal)
    }
    
    convenience init(brand : String, volume : Int, price : Int, name : String, manufactured : Date, temperature : Int){ //No Sugar
        self.init(sugarContent: 0, brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature : temperature, kcal : 50)
    }
    
    func isSugarfree(standard : Int) -> Bool{
        return self.sugarContent < standard
    }
}
