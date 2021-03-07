//
//  BeverageFactory.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/03/02.
//

import UIKit

protocol BeverageFactory {
    func makeBeverage(beveragetype : Beverage.Type, _ manufactured: Date) -> Beverage
}
