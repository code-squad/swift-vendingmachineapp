//
//  OutputView.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/23.
//

import UIKit

class OutputView: UIView {
    func setting(with stock : Dictionary<String,Int>) {
        self.backgroundColor = .gray
        
        let VMStackView = VendingMachineStackView()
        VMStackView.setting()
        
        for (key,value) in stock {
            let beverageStackView = BeverageStackView.init()
            beverageStackView.setting()
            beverageStackView.collectSubelements(drink : key, count : value)
            VMStackView.addArrangedSubview(beverageStackView)
        }
        
        self.addSubview(VMStackView)
        VMStackView.positionSetting()
        
    }
}
