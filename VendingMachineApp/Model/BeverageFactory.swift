//
//  BeverageFactory.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/27.
//

import Foundation

protocol BeverageFactory {
    func createBeverage(with name : String) -> Beverage
}
