//
//  File.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/03/08.
//

import UIKit

protocol AddBalance {
    func didPressButton(button: UIButton)
}

class BalanceButton : UIButton {
    
    var delegate : AddBalance!
    var addingValue : Int = 0
    
    func setting(with addingValue : Int) {
        self.addingValue = addingValue
        self.setTitle("+\(addingValue)", for: .normal)
        self.setTitleColor(.blue, for: .normal)
        self.addTarget(self, action: #selector(buttonPressed(button:)), for: .touchUpInside)
    }
    
    @objc func buttonPressed(button: UIButton) {
        delegate.didPressButton(button: button)
    }
}
