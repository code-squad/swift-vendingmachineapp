//
//  StrawberryMilk.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/02/24.
//

import Foundation

class StrawberryMilk : Milk {
    
    private let isContainStrawberry: Bool
        
    init(isContainStrawberry:Bool,isMilkFlavor: MilkFlavor,farmCode: String, brand: String, capacity: Int, price: Int, name: String, manufacturedAt: Date,isHot:Bool) {
        self.isContainStrawberry = isContainStrawberry
        super.init(isMilkFlavor: MilkFlavor.Strawberry, farmCode: farmCode, brand: brand, capacity: capacity, price: price, name: name, manufacturedAt: manufacturedAt,isHot: isHot)
        
    }
}
