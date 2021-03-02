//
//  BeverageDescripting.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/26.
//

import Foundation

protocol Productization {
    func isPastManufactured(with date:Date) -> Bool
    func isHot() -> Bool
    func isLowCalorie() -> Bool
}
