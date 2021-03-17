//
//  coffee.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/23.
//

import Foundation


class Coffee: Drink {
    
    private let caffeine : Double?
    
    init(brand : String, volume : Int, charge : Int, name :String, manufacturing : Date, caffeine : Double?) {
        self.caffeine = caffeine
        super.init(brand: brand, volume: volume, charge: charge, name: name, manufacturing: manufacturing)
    }
    
    convenience required init() {
        self.init(brand: "class", volume : 0, charge: 0, name : "Coffee", manufacturing: Date.init(), caffeine: 0)
    }
    
    required init?(coder: NSCoder) {
        caffeine = coder.decodeDouble(forKey: "caffeine")
        super.init(coder: coder)
    }
    
    func productCaffeine() -> Double {
        guard let nonOptional = caffeine else {
            return 0
        }
        
        return nonOptional
    }
    
    override func encode(with coder: NSCoder) {
        super.encode(with: coder)
        coder.encode(caffeine,forKey: "caffeine")
    }
}
