//
//  DrinkMenu1.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/03/16.
//

import Foundation
import UIKit

class DrinkMenu {
    private var list : [UIButton : Beverage.Type] = [:]
    private var imageList : [UIButton : UIImage] = [:]
    private(set) var drinkList = [StrawberryMilk.self, DietCola.self, TopAmericano.self]
    private var drinkImages = [#imageLiteral(resourceName: "StrawBerryMilk"),#imageLiteral(resourceName: "DietCola"),#imageLiteral(resourceName: "TopAmericano")]
    
    init(drinkButtons : [UIButton]) {
        self.list = Dictionary(uniqueKeysWithValues: zip(drinkButtons, drinkList))
        self.imageList = Dictionary(uniqueKeysWithValues: zip(drinkButtons, drinkImages))
    }
    
    func add(button : UIButton) -> Beverage.Type? {
        return list[button]
    }
    
    func purchaseHistoryImage(button : UIButton) -> UIImage? {
        return imageList[button]
    }
}
