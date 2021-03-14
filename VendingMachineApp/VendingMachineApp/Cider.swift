//
//  Cider.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/03/04.
//

import Foundation

class Cider : Soda{
    private let appleContent : Int
    
    init(appleContent: Int, sugarContent : Int, brand: String, volume: Int, price: Int, name: String, manufactured: Date, temperature: Int, kcal: Int) {
        self.appleContent = appleContent
        super.init(sugarContent: sugarContent, brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature: temperature, kcal: kcal)
    }
    
    required convenience init(manufactured: Date) {
        self.init(appleContent: 30, sugarContent: 0, brand: "와인사랑", volume: 355, price: 11000, name: "SOMERSBY", manufactured: manufactured, temperature: 1, kcal: 180)
    }
    
    func isHighcontent(standard: Int) -> Bool{
        return appleContent > standard
    }
}
