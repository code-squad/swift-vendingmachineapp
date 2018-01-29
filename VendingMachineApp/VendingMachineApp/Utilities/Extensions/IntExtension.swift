//
//  IntExtension.swift
//  VendingMachineApp
//
//  Created by 심 승민 on 2018. 1. 29..
//  Copyright © 2018년 심 승민. All rights reserved.
//

import UIKit

extension Int {
    func currency() -> String? {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .decimal
        return formatter.string(from: self as NSNumber)
    }

    func degrees(in total: Int?) -> Int {
        guard let total = total, total != 0 else { return 0 }
        return (self*360)/total
    }

    var radians: CGFloat {
        return (CGFloat.pi*CGFloat(self))/180
    }
}
