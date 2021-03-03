//
//  Cantata.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/24.
//

import Foundation

class Cantata: Coffee {
    
    private let bean : Beans
    
    init(brand : String, volume : Int, charge : Int, name :String, manufacturing : Date, caffeine : Double?, bean : Beans) {
        self.bean = bean
        super.init(brand: brand, volume: volume, charge: charge, name: name, manufacturing: manufacturing, caffeine: caffeine)
    }
    
    func productBeans() -> Beans {
        return self.bean
    }
}
