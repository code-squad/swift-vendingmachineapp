//
//  BeveragesButton.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/03/02.
//

import Foundation
import UIKit

protocol BeverageIncreasable {
    func increase(action : ((Beverage) -> Void)?)
}

class BeveragesButton : UIButton, BeverageIncreasable {
    func increase(action: ((Beverage) -> Void)?) {
        return
    }
}
