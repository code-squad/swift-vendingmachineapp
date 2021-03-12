//
//  DrinkMenu.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/03/09.
//

import Foundation

class DrinkMenu : NSObject, NSCoding {
    private(set) var list : [Beverage]
    
    override init() {
        self.list = [StrawberryMilk.init(), DietCola.init(), TopAmericano.init()]
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(list, forKey: "list")
    }

    required init?(coder: NSCoder) {
        self.list = coder.decodeObject(forKey: "list") as! [Beverage]
    }
    
    func addMenu(beverage : Beverage) {
        list.append(beverage)
    }
    
    func remove() {
        list = []
    }
}
