//
//  Cola.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/24.
//

import Foundation

class Cola: Soda {
    
    private let sugarContent : Double
    
    init(brand : String, volume : Int, charge : Int, name :String, manufacturing : Date, package : Materials, sugarContent : Double) {
        self.sugarContent = sugarContent
        super.init(brand: brand, volume: volume, charge: charge, name: name, manufacturing: manufacturing, package: package)
    }
    
    func isUnsweetened() -> Bool {
        return sugarContent < 2
    }
}
