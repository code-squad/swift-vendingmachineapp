//
//  Beveragable.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/03/03.
//

import Foundation

protocol Beveragable {
    func isExpired(with date:Date) -> Bool
    func isHot() -> Bool
    func isLowCalorie() -> Bool
}
