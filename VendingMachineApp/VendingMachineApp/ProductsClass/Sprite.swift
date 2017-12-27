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
    init(sugarContent: Double, volume: Int, price: Int, name: String, manufacturingDate: String, labelColor: String, forBusiness used: Bool) {
        self.bottelLabelColor = labelColor
        self.businessUse = used
        super.init(kind: "스프라이트", sugarContent: sugarContent, temperature: 4, brand: "코카콜라", volume: volume, price: price, name: name, manufacturingDate: manufacturingDate)
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
