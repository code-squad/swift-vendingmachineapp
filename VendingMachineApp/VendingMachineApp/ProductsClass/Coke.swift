//
//  Coke.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 13..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

class Coke: SodaPop {
    private let bottelLabelColor: String
    private var businessUse: Bool
    init(manufacturingDate: Date) {
        self.bottelLabelColor = "RED"
        self.businessUse = true
        super.init(kind: "콜라", sugarContent: 4, temperature: 4, brand: "코카콜라", volume: 250, price: 700, name: "CocaCola", manufacturingDate: manufacturingDate)
    }
    override var description: String {
        return "\(String(describing: type(of: self)))"
    }

    func isBusinessUse() -> Bool {
        return businessUse
    }
    func isLabelOriginalColor() -> String {
        return bottelLabelColor
    }
}
