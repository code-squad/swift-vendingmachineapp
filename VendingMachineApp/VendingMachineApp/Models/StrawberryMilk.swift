//
//  File.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/24.
//

import Foundation

class StrawberryMilk: Milk {
    enum Container: String {
        case box = "Strawberry Milk Box"
        case bottle = "Strawberry Milk Bottle"
        case stick = "Strawberry Milk Stick"
    }
    
    private var container: Container
    
    init(date: Date, fat: Int, container: Container, expiration: Date, hot: Bool, calorie: Int) {
        self.container = container
        super.init(brand: "서울우유", capacity: 480, price: 1500, name: container.rawValue, date: date, fat: fat, expiration: expiration, hot: hot, calorie: calorie)
    }
}
