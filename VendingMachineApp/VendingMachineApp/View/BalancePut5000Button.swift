//
//  BalancePut5000Button.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/03/02.
//

import UIKit

class BalancePut5000Button : UIButton, BalanceIncreasable {
 
    private let balance : Int
    
    override init(frame: CGRect) {
        balance = 5000
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        balance = 5000
        super.init(coder: coder)
    }
    
    func increase(action: ((Int) -> Void)?) {
        action?(balance)
    }
}
