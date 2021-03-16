//
//  paymenu1.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/03/16.
//
import Foundation
import UIKit

class PaymentMenu {
    private(set) var list : [UIButton:Int]
    private let payInfo = [1000,5000]
    
    init(buttons : [UIButton]) {
        list = Dictionary(uniqueKeysWithValues: zip(buttons,payInfo))
    }
    
    func add(button : UIButton) -> Int {
        return list[button] ?? 0
    }
}
