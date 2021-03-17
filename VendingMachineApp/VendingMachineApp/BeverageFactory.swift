//
//  BeverageFactory.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/03/16.
//

import Foundation
import UIKit

class BeverageFactory {
    static func make(_ drinkType : Beverage.Type) -> Beverage {
        return drinkType.init()
    }
    
    static func makeImage(_ drinkType : Beverage.Type) -> UIImage? {
        let image = UIImage(named: "\(drinkType)")
        return image
    }
}
