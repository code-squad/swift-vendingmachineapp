//
//  CoinManageable.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/03/03.
//

import Foundation

protocol CoinManageable {
    func inserted(_ coin: Int)
    func checked(handle: (Int) -> ())
    func expended(to coin: Int)
    func used<T>(handle: (Int) -> T) -> T
}
