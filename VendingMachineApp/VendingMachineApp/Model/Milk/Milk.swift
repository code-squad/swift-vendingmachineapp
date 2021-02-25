    //
    //  Milk.swift
    //  VendingMachineApp
    //
    //  Created by kiyoungj on 2021/02/22.
    //

    import Foundation

    enum MilkType : String {
        case StrawberryMilk = "딸기우유"
        case ChocolaMilk = "초코우유"
        case BananaMilk = "바나나우유"
    }

    class Milk: Drink {
        
        private var farmCode: String
        
        init(farmCode:String, brand: String, weight: Int, price: Int, name: String, madeDate: Date) {
            self.farmCode = farmCode
            super.init(brand: brand, weight: weight, price: price, name: name, madeDate: madeDate)
        }
        
        
        
    }
