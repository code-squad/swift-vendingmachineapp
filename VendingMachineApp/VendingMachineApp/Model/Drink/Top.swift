//
//  Top.swift
//  VendingMachine
//
//  Created by yangpc on 2017. 11. 16..
//  Copyright © 2017년 JK. All rights reserved.
//

import Foundation

class Top: Coffee {
    var taste: Taste
    enum Taste {
        case theBlack
        case sweetAmericano
        case masterLatte
        case chocolateMocha
    }
    init?(calorie: String,
          brand: String,
          weight: String,
          price: String,
          name: String,
          dateOfManufacture: String,
          isHot: Bool,
          amountOfCaffeine: String,
          nameOfCoffeeBeans: String,
          taste: Taste) {
        self.taste = taste
        super.init(calorie: calorie,
                   brand: brand,
                   weight: weight,
                   price: price,
                   name: name,
                   dateOfManufacture: dateOfManufacture,
                   isHot: isHot,
                   amountOfCaffeine: amountOfCaffeine,
                   nameOfCoffeeBeans: nameOfCoffeeBeans)
        self.typeOfProduct = "TOP커피"
    }

}
