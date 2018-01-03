//
//  lowFatBananMilk.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 13..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

class LightBananaMilk: Milk {
    private let bottleCapColor: String = "BLUE"
    convenience init() {
        self.init(manufacturingDate: Date())
    }
    init(manufacturingDate: Date) {
        super.init(kind: "바나나", fatContent: 1.5, temperature: 4, brand: "빙그레", volume: 250, price: 700, name: "저지방 바나나우유", manufacturingDate: manufacturingDate)
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

    func hasBlueCap() -> Bool {
        return bottleCapColor == "BLUE"
    }
}
