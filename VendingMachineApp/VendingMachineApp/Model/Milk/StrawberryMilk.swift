//
//  StrawberryMilk.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/24.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

class StrawberryMilk: Milk {
    static func everyDayStrawberryMilk() -> StrawberryMilk {
        return StrawberryMilk(brand: "서울우유", amount: 200, price: 1000, name: "날마다딸기우유")
    }
}
