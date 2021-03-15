//
//  FoodColoring.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/26.
//

import Foundation

class FoodColoring: NSObject, NSCoding {
    private let color: String
    private let chemicalConcentration: Int
    private let isHazardous: Bool
    
    init(color: String, chemicalConcentration: Int) {
        self.color = color
        self.chemicalConcentration = chemicalConcentration
        self.isHazardous = chemicalConcentration > 100
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(color, forKey: "color")
        coder.encode(chemicalConcentration, forKey: "chemicalConcentration")
        coder.encode(isHazardous, forKey: "isHazardous")
    }
    
    required init?(coder eDecoder: NSCoder) {
        color = eDecoder.decodeObject(forKey: "color") as! String
        chemicalConcentration = eDecoder.decodeInteger(forKey: "chemicalConcentration")
        isHazardous = eDecoder.decodeBool(forKey: "isHazardous")
    }
    
    convenience init(color: String) {
        self.init(color: color, chemicalConcentration: 0)
    }
}
