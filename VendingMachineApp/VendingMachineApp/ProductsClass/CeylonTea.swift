//
//  CeylonTea.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 17..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

class CeylonTea: Milk {
    private let flavor: String
    init(volume: Int, price: Int, manufacturingDate: String) {
        self.flavor = "홍차향"
        super.init(kind: "밀크티", fatContent: 7, temperature: 90, brand: "롯데", volume: volume, price: price, name: "실론티", manufacturingDate: manufacturingDate)
    }
    override var description: String {
        return "\(String(describing: type(of: self)))"
    }

    func hasFlavor() -> Bool {
        return flavor == "홍차향"
    }
}
