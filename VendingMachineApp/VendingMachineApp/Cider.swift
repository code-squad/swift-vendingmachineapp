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
    
    func isHighcontent(standard: Int) -> Bool{
        return appleContent > standard
    }
}
