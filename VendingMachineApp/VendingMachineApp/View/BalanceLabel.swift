//
//  BalanceLabel.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/03/08.
//

import UIKit

class BalanceLabel: UILabel {
    func setting(count : Int) {
        self.text = "\(count)원"
    }
}
