//
//  StrawberryMilk.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/02/24.
//

import Foundation

class StrawberryMilk : Milk {
    
    private let isContainStrawberry: Bool
        
    init(isContainStrawberry:Bool,isMilkFlavor: MilkFlavor,farmCode: String, brand: String, capacity: Int, price: Int, name: String, madeDate: Date,isHot:Bool, beverageType:BeverageType) {
        self.isContainStrawberry = isContainStrawberry
        super.init(isMilkFlavor: MilkFlavor.Strawberry, farmCode: farmCode, brand: brand, capacity: capacity, price: price, name: name, madeDate: madeDate,isHot: isHot, beverageType: BeverageType.Milk)
        
    }
}
