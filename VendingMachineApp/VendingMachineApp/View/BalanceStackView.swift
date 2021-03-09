//
//  BalanceStackView.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/03/08.
//

import UIKit

class BalanceStackView: UIStackView, AddBalance {
    
    func setting() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .vertical
        self.spacing = 10
        self.alignment = .center
    }
    
    func collectSubelements() {
        let balanceButton_1000 = BalanceButton.init()
        balanceButton_1000.setting(with: 1000)
        
        let balanceButton_5000 = BalanceButton.init()
        balanceButton_5000.setting(with: 5000)
        
        let balanceLabel = BalanceLabel.init()
        balanceLabel.setting(count: 0)
        
        self.addArrangedSubview(balanceButton_1000)
        self.addArrangedSubview(balanceButton_5000)
        self.addArrangedSubview(balanceLabel)
    }
    
    func didPressButton(button: UIButton) {
        let index = subviews.firstIndex() {
            guard let downCasting = $0 as? UILabel else {
                return false
            }
            return true
        }
    }
    
}
