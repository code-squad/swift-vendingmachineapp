//
//  Shopable.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/16.
//

import Foundation

protocol Shopable {
    
    func isPurchashable(with money: Int) -> Bool
    
    func subtractPrice(from balance: Int) -> Int
    
}
