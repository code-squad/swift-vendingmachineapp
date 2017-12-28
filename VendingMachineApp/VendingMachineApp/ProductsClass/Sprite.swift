//
//  Sprite.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 17..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

class Sprite: SodaPop {
    private let bottelLabelColor: String
    private var businessUse: Bool
    init(manufacturingDate: Date) {
        self.bottelLabelColor = "Green"
        self.businessUse = false
        super.init(kind: "스프라이트", sugarContent: 4, temperature: 4, brand: "코카콜라", volume: 200, price: 700, name: "스프라이트", manufacturingDate: manufacturingDate)
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
