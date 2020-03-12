//
//  BalanceButton.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/03/12.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class BalanceButton: UIButton {
    
    private enum Item: Int {
        case thousand = 207
        case fiveThousand
        
        var money: Int {
            switch self {
            case .thousand: return 1000
            case .fiveThousand: return 5000
            }
        }
    }
    
    var customAction: ((Int) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    deinit {
        self.removeTarget(self, action: #selector(invokeAction), for: .touchUpInside)
    }
}

extension BalanceButton {
    private func setup() {
        self.addTarget(self, action: #selector(invokeAction), for: .touchUpInside)
    }
    
    @objc func invokeAction(sender: BeverageButton) {
        if let money = Item(rawValue: tag)?.money {
            customAction?(money)
        }
    }
}
