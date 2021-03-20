//
//  MatchingImage.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/20.
//

import UIKit

class MatchingImage {

    let images = [UIImage(named: "0.jpg"), UIImage(named: "1.jpg"), UIImage(named: "2.jpg"), UIImage(named: "3.jpg"), UIImage(named: "4.jpg")]
    let beverageType = [DrPepper.self, FantaOrange.self, Sprite.self, CantataAmericano.self, BlueBottle.self]
    
    func matchImage(type: Beverage.Type) -> UIImage {
        guard let index = MatchingImage().beverageType.firstIndex(where: { $0 == type.self } ) else { return UIImage() }
        return images[index] ?? UIImage()
    }

}
