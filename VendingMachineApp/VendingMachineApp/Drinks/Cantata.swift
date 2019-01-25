//
//  Cantata.swift
//  VendingMachineApp
//
//  Created by 윤동민 on 16/01/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

enum PackingMaterial: Int {
    case cans = 1, plastic
}

class Cantata: Coffee {
    private var packingMaterial: PackingMaterial
    
    init(name: String, volume: Int, brand: String, date: String, caffeineAmount: Double, material: PackingMaterial) {
        self.packingMaterial = material
        super.init(name: name, volume: volume, price: 3000, brand: brand, date: date, caffeineAmount: caffeineAmount)
    }
    
    convenience init() {
        self.init(name: "칸타타",
                  volume: 400,
                  brand: "달달한칸타타",
                  date: "20170801",
                  caffeineAmount: 1.3,
                  material: .plastic)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.packingMaterial = PackingMaterial.init(rawValue: aDecoder.decodeInteger(forKey: "packingMaterial")) ?? .cans
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(packingMaterial.rawValue, forKey: "packingMaterial")
    }
    
    func isPacking(with pack: PackingMaterial) -> Bool {
        return self.packingMaterial == pack
    }
    
    override func convertToImageName() -> String {
        return "칸타타"
    }
}
