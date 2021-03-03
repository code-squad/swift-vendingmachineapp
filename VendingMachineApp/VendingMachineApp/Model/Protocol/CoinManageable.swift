//
//  CoinManageable.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/03/03.
//

import Foundation

protocol CoinManageable {
    func inserted(_ coin: Int)
    func CheckCoins(handle: (Int) -> ())
    func expended(to coin: Int)
}
