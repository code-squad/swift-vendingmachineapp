//
//  Cider.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/24.
//

import Foundation

class Cider: Soda {
    
    private let calories : Int // kcal 단위
    
    init(brand : String, volume : Int, charge : Int, name :String, manufacturing : Date, package : Materials, calories : Int) {
        self.calories = calories
        super.init(brand: brand, volume: volume, charge: charge, name: name, manufacturing: manufacturing, package: package)
    }
    
    convenience init() {
        self.init(brand: "칠성", volume: 255, charge: 630, name: "칠성-사이다", manufacturing: Date.init(), package : Materials.steel, calories : 327) //제조일자 : now
    }
    
    func productCalorie() -> String {
        return "\(calories) kcal"
    }
}
