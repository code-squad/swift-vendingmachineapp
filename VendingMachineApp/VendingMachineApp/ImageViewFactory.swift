//
//  ImageViewFactory.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 7. 10..
//  Copyright © 2018년 moon. All rights reserved.
//

import UIKit

struct ImageViewFactory {
    
    static private func makeImageName(from type: BeverageType) -> String {
        switch type {
        case BeverageType(StrawberryMilk.self):
            return "0.png"
        case BeverageType(BananaMilk.self):
            return "1.png"
        case BeverageType(Coke.self):
            return "2.png"
        case BeverageType(TOP.self):
            return "3.png"
        case BeverageType(Sprite.self):
            return "4.png"
        default:
            return ""
        }
    }
    
    static func makeImageView(_ beverages: [Beverage]) -> [UIImageView] {
        var beveragesImageViews: [UIImageView] = []
        for index in beverages.indices {
            let imageView = UIImageView()
            let imageName = "imgsource/" + makeImageName(from: BeverageType(type(of: beverages[index])))
            imageView.image = UIImage(named: imageName)
            imageView.frame = CGRect(x: 40 + (index * 50), y: 575, width: 140, height: 100)
            beveragesImageViews.append(imageView)
        }
        return beveragesImageViews
    }
}

