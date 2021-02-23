//
//  DietCola.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class DietCola : Soda {
    init(liter: Int, price: Int, name: String, date: String) {
        super.init(brand: SodaBrand.Pepsi.description, liter: liter, price: price, name: name, date: date)
    }
}
