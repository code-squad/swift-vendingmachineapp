//
//  CoinManageable.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/03/03.
//

import Foundation

protocol CoinManageable {
    var coinPublisher: Published<Int>.Publisher { get }
    var leftCoins: Int { get }
    func inserted(_ coin: Int)
    func expended(to coin: Int)
}
