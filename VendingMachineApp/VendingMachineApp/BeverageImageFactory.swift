//
//  BeverageImageFactory.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/03/15.
//

import UIKit

protocol BeverageImageMakeable {
    static func make(of beverage: Beverage) -> UIImageView?
}

class BeverageImageFactory: BeverageImageMakeable {
    static func make(of beverage: Beverage) -> UIImageView? {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "\(type(of: beverage))")
        
        return imageView
    }
}
