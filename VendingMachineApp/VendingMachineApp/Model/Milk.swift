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
        
        override init(brand: String, capacity: Int, price: Int, name: String, madeDate: Date) {
            super.init(brand: brand, capacity: capacity, price: price, name: name, madeDate: madeDate)
        }
    }
