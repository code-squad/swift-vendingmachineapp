//
//  BeverageImageFactory.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/03/17.
//

import Foundation
import UIKit

class BeverageImageFactory {
    static func make(_ drinkType : Beverage.Type) -> UIImage? {
        let image = UIImage(named: "\(drinkType)")
        return image
    }
}
