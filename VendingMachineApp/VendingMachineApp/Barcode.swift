//
//  Barcode.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/19/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
