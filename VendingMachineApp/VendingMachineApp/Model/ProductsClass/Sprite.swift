//
//  Sprite.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 17..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

class Sprite: SodaPop {
    private let bottelLabelColor: String = "Green"
    private let businessUse: Bool = false
    convenience init() {
        self.init(manufacturingDate: Date())
    }
    init(manufacturingDate: Date) {
        super.init(kind: "스프라이트", sugarContent: 4, temperature: 4, brand: "코카콜라", volume: 200, price: 700, name: "스프라이트", manufacturingDate: manufacturingDate)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
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
