//
//  BalancePut1000Button.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/03/02.
//

import UIKit

class BalancePut1000Button : UIButton, BalanceIncreasable {
 
    private let balance : Int
    private var action : ((Int)->Void)?
    
    override init(frame: CGRect) {
        balance = 1000
        super.init(frame: frame)
        setTarget()
    }
    
    required init?(coder: NSCoder) {
        balance = 1000
        super.init(coder: coder)
        setTarget()
    }
    
    private func setTarget() {
        self.addTarget(self, action: #selector(touch(_:)), for: .touchUpInside)
    }
    
    @objc private func touch(_ sender : UIButton) {
        increase(action: action)
    }
    
    func increase(action: ((Int) -> Void)?) {
        action?(balance)
    }
}
