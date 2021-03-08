//
//  BeverageProtocols.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/03.
//

import Foundation

protocol SafelyDrinkable {
    func isStillEdible(at date: Date) -> Bool
}

protocol LactoseFree {
    func isLactoseFree() -> Bool
}

protocol HotServable {
    func isHot() -> Bool
}

protocol CaffeineContainable {
    func hasCaffeine() -> Bool
}

protocol CarbonationHavable {
    func hasCarbonation() -> Bool
}
