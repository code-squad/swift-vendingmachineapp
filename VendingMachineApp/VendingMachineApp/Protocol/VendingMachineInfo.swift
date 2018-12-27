//
//  VendingMachineInfo.swift
//  VendingMachine
//
//  Created by 조재흥 on 18. 12. 21..
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

protocol VendingMachineInfo {
    func checkBalance() -> String
    func buyableProductList() -> [String: BeverageInfo]
    func checkInventory() -> [String: Int]
}
