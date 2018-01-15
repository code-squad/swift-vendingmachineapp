//
//  RealBananaMilk.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 13..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

class RealBananaMilk: Milk {
    private let bananMilkColor: String = "WHITE"
    private let flavor: String = "바나나향"
    convenience init() {
        self.init(manufacturingDate: Date())
    }
    init(manufacturingDate: Date) {
        super.init(kind: "바나나", fatContent: 7, temperature: 4, brand: "매일우유", volume: 270, price: 1200, name: "바나나는 원래 하얗다", manufacturingDate: manufacturingDate)
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
    func isRealBanana() -> Bool {
        return bananMilkColor == "WHITE"
    }
    func hasBananaFlavor() -> Bool {
        return flavor == "바나나향"
    }
}
