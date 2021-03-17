//
//  paymenu1.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/03/16.
//
import Foundation
import UIKit

class PaymentMenu {
    private(set) var list : [UIButton:Coin]
    
    enum Coin : Int , CaseIterable {
        case onethousand = 1000
        case fivethousand = 5000
        
        var value : Int {
            return self.rawValue
        }
    }
    
    init(buttons : [UIButton]) {
        list = Dictionary(uniqueKeysWithValues: zip(buttons,Coin.allCases))
    }
    
    subscript(button : UIButton) -> Int {
        return list[button]?.value ?? 0
    }
}
