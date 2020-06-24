//
//  PlusBalanceButton.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/15.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class BalanceButton: UIButton {
    var action: ((Money?) -> Void)?
    var balance: Money? { return nil }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTarget()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureTarget()
    }
    
    deinit {
        removeTarget(self, action: #selector(invokeAction(sender:)), for: .touchUpInside)
    }
    
    private func configureTarget() {
        addTarget(self, action: #selector(invokeAction(sender:)), for: .touchUpInside)
    }
    
    @objc func invokeAction(sender: BalanceButton) { }
}
