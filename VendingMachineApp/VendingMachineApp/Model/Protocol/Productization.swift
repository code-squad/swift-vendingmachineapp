//
//  BeverageDescripting.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/26.
//

import Foundation

protocol Productization {
    func validate(with date:Date) -> Bool
    func isHot() -> Bool
    func isLowCalorie() -> Bool
}
