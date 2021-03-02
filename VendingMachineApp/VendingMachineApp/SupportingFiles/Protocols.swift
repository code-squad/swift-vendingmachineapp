//
//  Drinkable.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/23.
//

import Foundation

protocol LocationTrackable {
    func isDomestic() -> Bool
}

protocol FoodColoringApplicable {
    var foodColoring: FoodColoring? { get }
    func isUsingFoodColoring() -> Bool
}

protocol CaffeineSuppliable {
    var caffeine: Int { get }
    func highCaffeine() -> Bool
}

protocol HotBeverageAvailable {
    var inHeatingCabinet: Bool { get }
    func isHot() -> Bool
}

protocol IsHazardous: CaffeineSuppliable & FoodColoringApplicable {
    func isBadForBody() -> Bool
}

protocol EnergyBoostable: CaffeineSuppliable & HotBeverageAvailable {
    func isEnergyBoosting() -> Bool
}
