//
//  PlusBalanceButton.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/15.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

protocol BalanceTagControl {
    func money() -> Int?
}

final class BalanceButton: UIButton, BalanceTagControl {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func money() -> Int? {
        return BalanceItemByTag(rawValue: tag)?.money()
    }
}

enum BalanceItemByTag: Int {
    case oneThousand = 0
    case fiveThousand
    
    func money() -> Int {
        switch self {
        case .oneThousand:
            return 1000
        case .fiveThousand:
            return 5000
        }
    }
}
