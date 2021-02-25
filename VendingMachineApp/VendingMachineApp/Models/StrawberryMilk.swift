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
        
        func capacity() -> Int {
            switch self {
            case .box:
                return 250
            case .bottle:
                return 300
            case .stick:
                return 50
            }
        }
        func price() -> Int{
            switch self {
            case .box:
                return 1000
            case .bottle:
                return 1800
            case .stick:
                return 800
            }
        }
    }
    
    private var container: Container
    
    init(date: Date, lowFat: Bool, container: Container) {
        self.container = container
        super.init(brand: "서울우유", capacity: container.capacity(), price: container.price(), name: container.rawValue, date: date, lowFat: lowFat)
    }
}
