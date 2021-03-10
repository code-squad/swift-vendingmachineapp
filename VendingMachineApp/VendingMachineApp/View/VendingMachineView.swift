//
//  OutputView.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/23.
//

import UIKit

class VendingMachineView: UIView {
    func setting(with stock : Dictionary<ObjectIdentifier,[Drink]>) {
        self.backgroundColor = .gray
        
        let VMStackView = VendingMachineStackView()
        VMStackView.setting()
        
        let balanceStackView = BalanceStackView.init()
        balanceStackView.setting()
        balanceStackView.collectSubelements()
        
        for (key,value) in stock {
            let beverageStackView = BeverageStackView.init()
            beverageStackView.collectSubelements(drink : value.first?.name ?? "nil", count : value.count)
            VMStackView.addArrangedSubview(beverageStackView)
        }
        VMStackView.addArrangedSubview(balanceStackView)
        
        self.addSubview(VMStackView)
        VMStackView.positionSetting()
    }
}
