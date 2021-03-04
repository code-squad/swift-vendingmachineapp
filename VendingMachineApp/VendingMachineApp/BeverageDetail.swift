//
//  BeverageDetail.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/03/02.
//

import Foundation

protocol BeverageDetail {
    func isExpired(now date: Date) -> Bool
    func isHot(temparature standard: Int) -> Bool
    func isLowCalorie(calories standard: Int) -> Bool
    func isPurchasable(balance: Int) -> Bool
}
