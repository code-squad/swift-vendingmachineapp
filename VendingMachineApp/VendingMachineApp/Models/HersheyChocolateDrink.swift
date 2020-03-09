//
//  Chocoemon.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/04.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

class HersheyChocolateDrink: Milk {
    
    init?(volume: Int, price: Int, name: String,
          manufacturingDateInfo: String, expirationDateInfo: String) {
        super.init(brand: "허쉬초콜릿드링크",
                   volume: volume, price: price,
                   name: name,
                   manufacturingDateInfo: manufacturingDateInfo,
                   expirationDateInfo: expirationDateInfo)
    }
    
}
