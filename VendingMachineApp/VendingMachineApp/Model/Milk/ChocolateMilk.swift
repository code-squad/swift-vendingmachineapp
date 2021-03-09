//
//  ChocolaMilk.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/02/24.
//

import Foundation

class ChocolateMilk: Milk {
    
    private let isContainChocolate:Bool
    
<<<<<<< HEAD
    init(isContainChocolate:Bool, farmCode: String, brand: String, capacity: Int, price: Int, name: String, manufacturedAt: Date,isHot:Bool) {
        self.isContainChocolate = isContainChocolate
        super.init(isMilkFlavor: MilkFlavor.Chocolate, farmCode: farmCode, brand: brand, capacity: capacity, price: price, name: name, manufacturedAt: manufacturedAt,isHot:isHot)
=======
    init(isContainChocolate:Bool, farmCode: String, brand: String, capacity: Int, price: Int, name: String, madeDate: Date,isHot:Bool) {
        self.isContainChocolate = isContainChocolate
        super.init(isMilkFlavor: MilkFlavor.Chocolate, farmCode: farmCode, brand: brand, capacity: capacity, price: price, name: name, madeDate: madeDate,isHot:isHot)
>>>>>>> 5b3f697cd3a941bc1567d12ff2734aacd43cf2da
    }
}
