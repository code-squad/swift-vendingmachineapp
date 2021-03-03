//
//  BeverageStockIncreasable.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/03/02.
//

import Foundation

protocol BeverageStockIncreasable {
    func increase(action: ((Beverage) -> Void)?)
}
