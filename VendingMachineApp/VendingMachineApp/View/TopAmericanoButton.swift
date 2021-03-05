//
//  TopAmericanoButton.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/03/02.
//

import Foundation
import UIKit

class TopAmericanoButton : BeveragesButton {
    
    override func increase(action: ((Beverage) -> Void)?) {
        action?(TopAmericano())
    }
}
