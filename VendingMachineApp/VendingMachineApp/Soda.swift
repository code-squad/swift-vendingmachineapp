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
    
    required init(manufactured: Date) {
        self.sugarContent = 0
        super.init(manufactured: manufactured)
    }
    
    required init?(coder: NSCoder) {
        self.sugarContent = coder.decodeObject(forKey: "sugarContent") as? Int ?? 0
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(self.sugarContent, forKey: "sugarContent")
        super.encode(with: coder)
    }
    
    func isSugarfree(standard : Int) -> Bool{
        return self.sugarContent < standard
    }
}
