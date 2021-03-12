//
//  File.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/03/08.
//

import UIKit

class BalanceButton : UIButton {
    
    var addingValue : Int = 0
    
    func setting(with addingValue : Int) {
        self.addingValue = addingValue
        self.setTitle("+\(addingValue)", for: .normal)
        self.setTitleColor(.blue, for: .normal)
    }
}
