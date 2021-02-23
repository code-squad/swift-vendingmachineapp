//
//  DietCola.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class DietCola : Soda {
    init(liter: Int, price: Int, name: String, manufactured: Date) {
        super.init(brand: Brand.Soda(.Pepsi) , liter: liter, price: price, name: name, manufactured: manufactured)
    }
}
