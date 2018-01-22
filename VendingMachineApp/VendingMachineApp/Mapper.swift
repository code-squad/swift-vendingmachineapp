//
//  Mapper.swift
//  VendingMachineApp
//
//  Created by 심 승민 on 2018. 1. 15..
//  Copyright © 2018년 심 승민. All rights reserved.
//

import Foundation
import UIKit

struct Mapper {
    // 직접 매칭해주지만, sender.tag값이 범위에 들어가면 열거형 타입이 생성되고 아니면 nil값이 됨.
    static func mappingUnit(with sender: UIButton) -> MoneyManager.Unit? {
        return MoneyManager.Unit(rawValue: sender.tag)
    }

    static func mappingMenu<T: EnumCollection>(with sender: UIView) -> T? {
        return T.getCase(rawValue: sender.tag) as? T
    }

}
