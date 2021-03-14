//
//  BeverageCreater.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/03/03.
//

import Foundation

class BeverageCreater : BeverageFactory {
    func makeBeverage(beveragetype : Beverage.Type, manufactured : Date) -> Beverage {
        return beveragetype.init(manufactured: manufactured)
    }
}
