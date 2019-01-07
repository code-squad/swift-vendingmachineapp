//
//  SoftDrink.swift
//  VendingMachine
//
//  Created by 윤지영 on 11/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class SoftDrink: BeverageGroup {
    private let package: BeveragePackage

    init(brand: String,
         name: String,
         volume: Int,
         price: Int,
         dateOfManufacture: Date,
         package: BeveragePackage) {
        self.package = package
        super.init(brand: brand,
                   name: name,
                   volume: volume,
                   price: price,
                   dateOfManufacture: dateOfManufacture)
    }

    convenience required init() {
        self.init(
            brand: "노브랜드",
            name: "탄산음료",
            volume: 500,
            price: 1700,
            dateOfManufacture: Date.subtractingDaysFromNow(by: 20),
            package: .plastic)
    }

    override var group: BeverageCategory {
        return .softDrink
    }

    /* MARK: NSSecureCoding*/
    enum Keys: String {
        case package = "package"
    }

    required init?(coder aDecoder: NSCoder) {
        guard let packageNumber = aDecoder
            .decodeObject(of: NSNumber.self, forKey: Keys.package.rawValue) else { return nil }
        guard let package = BeveragePackage(rawValue: packageNumber) else { return nil }
        self.package = package
        super.init(coder: aDecoder)
    }

    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(NSNumber(value: package.rawValue), forKey: "package")
    }

}
