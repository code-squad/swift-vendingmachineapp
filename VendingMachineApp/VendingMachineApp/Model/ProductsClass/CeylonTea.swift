//
//  CeylonTea.swift
//  VendingMachine
//
//  Created by Mrlee on 2017. 12. 17..
//  Copyright © 2017년 Napster. All rights reserved.
//

import Foundation

class CeylonTea: Milk {
    private let flavor: String = "홍차향"
    convenience init() {
        self.init(manufacturingDate: Date())
    }
    init(manufacturingDate: Date) {
        super.init(kind: "밀크티", fatContent: 7, temperature: 90, brand: "롯데", volume: 250, price: 700, name: "실론티", manufacturingDate: manufacturingDate)
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

    func hasFlavor() -> Bool {
        return flavor == "홍차향"
    }
}
