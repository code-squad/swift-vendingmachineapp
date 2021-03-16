//
//  BeverageData.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/03/16.
//

import UIKit

class BeverageData {
    private var data: [UIButton : (beverageType: Beverage.Type, label: UILabel)] = [:]
    private let beverageTypes = [Cola.self, RedBull.self, StrawBerryMilk.self, TOP.self]
    
    func setUp(buttons: [UIButton], labels: [UILabel]) {
        let labelWithTypeZip = zip(beverageTypes, labels)
        let viewZip = zip(buttons, labelWithTypeZip)
        for (button, labelWithType) in viewZip {
            data[button] = labelWithType
        }
    }
    
    func showType(with sender: UIButton) -> Beverage.Type? {
        return data[sender]?.beverageType
        
    }
    
    func showLabel(sender: UIButton) -> UILabel? {
        return data[sender]?.label
    }
}
