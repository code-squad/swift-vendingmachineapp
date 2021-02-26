//
//  FoodColoring.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/26.
//

import Foundation

class FoodColoring {
    private let color: String
    private let chemicalConcentration: Int
    private let isHazardous: Bool
    
    init(color: String, chemicalConcentration: Int) {
        self.color = color
        self.chemicalConcentration = chemicalConcentration
        self.isHazardous = chemicalConcentration > 100
    }
}
