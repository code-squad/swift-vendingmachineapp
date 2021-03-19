//
//  OutputView.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/23.
//

import UIKit

class VendingMachineView: UIView {
    func setting(with stock : Dictionary<ObjectIdentifier,[Drink]>, howMuch money : Int) {
        self.backgroundColor = .gray
        
        let VMStackView = VendingMachineStackView()
        VMStackView.setConfiguration()
        
        let balanceStackView = BalanceStackView.init()
        balanceStackView.setConfiguration()
        balanceStackView.collectSubelements(howMuch : money)
        
        for (key,value) in stock {
            let beverageStackView = BeverageStackView.init()
            beverageStackView.collectSubelements(drink : value.first!, count : value.count)
            VMStackView.addArrangedSubview(beverageStackView)
        }
        VMStackView.addArrangedSubview(balanceStackView)
        
        self.addSubview(VMStackView)
        VMStackView.positionSetting()
    }
}
