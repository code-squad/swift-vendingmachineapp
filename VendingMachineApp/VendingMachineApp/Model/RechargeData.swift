//
//  RechargeData.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/03/16.
//

import UIKit

class RechargeData {
    private var data: [UIButton : CashManagementSystem.SelectCash] = [:]
    
    func setUP(buttons: [UIButton]) {
        data[buttons[0]] = CashManagementSystem.SelectCash.thousand
        data[buttons[1]] = CashManagementSystem.SelectCash.fiveThousands
    }
    
    func showCash(with sender: UIButton) -> CashManagementSystem.SelectCash? {
        return data[sender] ?? nil
    }
}
