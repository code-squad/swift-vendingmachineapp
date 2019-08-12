//
//  BeverageWithPhoto.swift
//  VendingMachineApp
//
//  Created by 김성현 on 12/08/2019.
//  Copyright © 2019 김성현. All rights reserved.
//

import UIKit

class BeverageWithPhoto: Beverage {
    
    var photo: UIImage?
    
    init(name: String, price: Coin, photo: UIImage?, brand: String, packageSize: Int, beverageTemperature: Int, expirationPeriod: TimeInterval) {
        self.photo = photo
        super.init(name: name, price: price, brand: brand, packageSize: packageSize, beverageTemperature: beverageTemperature, expirationPeriod: expirationPeriod)
    }
}
