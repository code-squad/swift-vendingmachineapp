//
//  Soda.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/23.
//

import Foundation

class Soda: Drink {
    
    private let package : Materials
    
    init(brand : String, volume : Int, charge : Int, name :String, manufacturing : Date, package : Materials) {
        self.package = package
        super.init(brand: brand, volume: volume, charge: charge, name: name, manufacturing: manufacturing)
    }
    
    func packingMaterial() -> Materials {
        return package
    }
}
