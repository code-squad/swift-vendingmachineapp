//
//  ChocolaMilk.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/02/24.
//

import Foundation

class ChocolateMilk: Milk {
    
    private let isContainChocolate:Bool
    
    init(isContainChocolate:Bool, farmCode: String, brand: String, capacity: Int, price: Int, name: String, madeDate: Date) {
        self.isContainChocolate = isContainChocolate
        super.init(farmCode: farmCode, brand: brand, capacity: capacity, price: price, name: name, madeDate: madeDate)
    }
}
