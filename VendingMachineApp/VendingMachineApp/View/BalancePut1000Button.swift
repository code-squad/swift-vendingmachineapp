//
//  BalancePut1000Button.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/03/02.
//

import UIKit

class BalancePut1000Button : UIButton, BalanceIncreasable {
 
    func increase(balance : Int, action: ((Int) -> Void)?) {
        action?(balance)
    }
}
