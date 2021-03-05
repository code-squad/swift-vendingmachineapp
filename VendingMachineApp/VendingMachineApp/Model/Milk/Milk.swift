    //
    //  Milk.swift
    //  VendingMachineApp
    //
    //  Created by kiyoungj on 2021/02/22.
    //
    
    import Foundation
    
    enum MilkFlavor {
        case normal
        case Strawberry
        case Chocolate
        case Banana
    }
    
    class Milk: Drink {
        
        private var farmCode: String
        private var isMilkFlavor: MilkFlavor
        
        init(isMilkFlavor:MilkFlavor, farmCode:String, brand: String, capacity: Int, price: Int, name: String, madeDate: Date,isHot: Bool) {
            self.farmCode = farmCode
            self.isMilkFlavor = isMilkFlavor
            super.init(brand: brand, capacity: capacity, price: price, name: name, madeDate: madeDate,isHot: isHot)
        }
    }
