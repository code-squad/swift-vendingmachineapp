//
//  Coke.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 13..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

class Coke: SodaPop {
    private let bottelLabelColor: String = "RED"
    private let businessUse: Bool = true
    convenience init() {
        self.init(manufacturingDate: Date())
    }
    init(manufacturingDate: Date) {
        super.init(kind: "콜라", sugarContent: 4, temperature: 4, brand: "코카콜라", volume: 250, price: 700, name: "Coke", manufacturingDate: manufacturingDate)
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
