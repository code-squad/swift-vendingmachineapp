//
//  DrinkableProtocol.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/02/25.
//

import Foundation

protocol DrinkableProtocol {
    
    func validate(date: Date) -> Bool
    func isHot() -> Bool
    func isLowCalorie() -> Bool
}
