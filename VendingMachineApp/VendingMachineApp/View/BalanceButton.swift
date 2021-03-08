//
//  File.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/03/08.
//

import UIKit

class BalanceButton : UIButton {
    func setting(with label : String) {
        self.setTitle(label, for: .normal)
        self.setTitleColor(.blue, for: .normal)
    }
}
