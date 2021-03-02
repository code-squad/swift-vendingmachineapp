//
//  BeverageDetail.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/03/02.
//

import Foundation

protocol BeverageDetail {
    func validate(with date:Date) -> Bool
    func isHot() -> Bool
    func isLowCalorie() -> Bool
}
