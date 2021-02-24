//
//  Beveragable.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/24.
//

import Foundation


protocol Beveragable {
    func validate(with date:Date) -> Bool
    func isHot() -> Bool
    func isLowCalorie() -> Bool
}
