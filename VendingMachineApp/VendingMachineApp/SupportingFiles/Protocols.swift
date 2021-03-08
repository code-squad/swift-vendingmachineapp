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
    func highCaffeine(caffeine criterion: Int) -> Bool
}

protocol HotBeverageAvailable {
    var temperature: Int { get }
    func isHot(temperature criterion: Int) -> Bool
}

protocol IsHazardous: CaffeineSuppliable & FoodColoringApplicable {
    func isBadForBody(caffeine: Int) -> Bool
}

protocol EnergyBoostable: CaffeineSuppliable & HotBeverageAvailable {
    func isEnergyBoosting(caffeine: Int, temperature: Int) -> Bool
}
