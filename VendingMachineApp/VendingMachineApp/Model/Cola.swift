//
//  Cola.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/24.
//

import Foundation

class Cola: Soda {
    
    private let unsweetened : Bool
    
    init(brand : String, volume : Int, charge : Int, name :String, manufacturing : Date, package : Materials, unsweetened : Bool) {
        self.unsweetened = unsweetened
        super.init(brand: brand, volume: volume, charge: charge, name: name, manufacturing: manufacturing, package: package)
    }
    
    convenience init() {
        self.init(brand: "CoCa-Cola", volume: 215, charge: 574, name: "코카콜라제로", manufacturing: Date.init(), package : Materials.steel, unsweetened : true) //제조일자 : now
    }
    
    func isUnsweetened() -> Bool {
        return unsweetened
    }
}
