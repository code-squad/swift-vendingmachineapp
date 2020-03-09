//
//  PapsiMini.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/04.
//  Copyright © 2020 Jason. All rights reserved.
//

import Foundation

class Pepsi: Soda {
    
    init?(volume: Int, price: Int, name: String, manufacturingDateInfo: String) {
        super.init(brand: "팹시", volume: volume,
                   price: price, name: name, manufacturingDateInfo: manufacturingDateInfo)
    }

}
