//
//  BalanceIncreasable.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/03/02.
//

import Foundation

@objc protocol BalanceIncreasable {
    func increase(action : ((Int) -> Void)?)
}
