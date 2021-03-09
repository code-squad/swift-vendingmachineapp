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
        
<<<<<<< HEAD
        init(isMilkFlavor:MilkFlavor, farmCode:String, brand: String, capacity: Int, price: Int, name: String, manufacturedAt: Date,isHot: Bool) {
            self.farmCode = farmCode
            self.isMilkFlavor = isMilkFlavor
            super.init(brand: brand, capacity: capacity, price: price, name: name, manufacturedAt: manufacturedAt,isHot: isHot)
=======
        init(isMilkFlavor:MilkFlavor, farmCode:String, brand: String, capacity: Int, price: Int, name: String, madeDate: Date,isHot: Bool) {
            self.farmCode = farmCode
            self.isMilkFlavor = isMilkFlavor
            super.init(brand: brand, capacity: capacity, price: price, name: name, madeDate: madeDate,isHot: isHot)
>>>>>>> 5b3f697cd3a941bc1567d12ff2734aacd43cf2da
        }
    }
