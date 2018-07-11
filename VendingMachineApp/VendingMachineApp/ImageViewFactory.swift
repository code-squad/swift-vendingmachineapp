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
            return "0"
        case BeverageType(BananaMilk.self):
            return "1"
        case BeverageType(Coke.self):
            return "2"
        case BeverageType(TOP.self):
            return "3"
        case BeverageType(Sprite.self):
            return "4"
        default:
            return ""
        }
    }
    
    static func makeImageView(_ beverage: Beverage) -> UIImageView {
        let imageView = UIImageView()
        let imageName = makeImageName(from: BeverageType(type(of: beverage)))
        imageView.image = UIImage(named: imageName)
        return imageView
    }
}

