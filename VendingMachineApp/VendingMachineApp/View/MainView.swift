//
//  MainView.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/28.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

protocol AnyDelegate: class {
    func updateBalanceLabel(amount: String)
}

class MainView: UIView {

    weak var someDelegate: SomeDelegate?
    
    @IBOutlet var addBalanceButtons: [UIButton]!
    
    @IBOutlet weak var balanceLabel: UILabel!
    
    @IBAction func addBalanceButtonTapped(_ sender: UIButton) {
        someDelegate?.addBalance(amount: sender.tag)
    }
}

extension MainView: AnyDelegate {
    func updateBalanceLabel(amount: String) {
        balanceLabel.text = "잔액: " + amount + "원"
    }
}
