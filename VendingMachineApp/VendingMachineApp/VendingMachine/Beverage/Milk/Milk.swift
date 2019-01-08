//
//  Milk.swift
//  VendingMachine
//
//  Created by 윤지영 on 11/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Milk: BeverageGroup {
    private let flavor: String?
    private let package: BeveragePackage
    private let useByDate: Double
    private let expirationDate: Date

    init(brand: String,
         name: String,
         volume: Int,
         price: Int,
         dateOfManufacture: Date,
         flavor: String? = nil,
         useByDate: Double,
         package: BeveragePackage) {
        self.flavor = flavor
        self.package = package
        self.useByDate = useByDate
        self.expirationDate = dateOfManufacture.addingDayInterval(useByDate)
        super.init(brand: brand,
                   name: name,
                   volume: volume,
                   price: price,
                   dateOfManufacture: dateOfManufacture)
    }

    convenience init(brand: String,
                     name: String,
                     volume: Int,
                     price: Int,
                     dateOfManufacture: Date,
                     flavor: String? = nil) {
        self.init(brand: brand,
                  name: name,
                  volume: volume,
                  price: price,
                  dateOfManufacture: dateOfManufacture,
                  flavor: flavor,
                  useByDate: 10,
                  package: BeveragePackage.paper)
    }

    convenience required init() {
        self.init(brand: "노브랜드",
                  name: "우유",
                  volume: 250,
                  price: 1000,
                  dateOfManufacture: Date.subtractingDaysFromNow(by: 5),
                  flavor: nil,
                  useByDate: 10,
                  package: BeveragePackage.paper)
    }

    override var group: BeverageCategory {
        return .milk
    }

    func hasFlavor() -> Bool {
        return flavor != nil
    }

    func validate(when date:Date) -> Bool {
        return date < expirationDate
    }

    /* MARK: NSSecureConding*/
    enum Keys: String {
        case flavor = "flavor"
        case package = "package"
        case useByDate = "useByDate"
        case expirationDate = "expirationDate"
    }

    required init?(coder aDecoder: NSCoder) {
        flavor = aDecoder.decodeObject(of: NSString.self, forKey: Keys.flavor.rawValue) as String?
        guard let packageNumber = aDecoder
            .decodeObject(of: NSNumber.self, forKey: Keys.package.rawValue) else { return nil }
        guard let useByDate = aDecoder
            .decodeObject(of: NSNumber.self, forKey: Keys.useByDate.rawValue) else { return nil }
        guard let expirationDate = aDecoder
            .decodeObject(of: NSDate.self, forKey: Keys.expirationDate.rawValue) else { return nil }
        guard let package = BeveragePackage(rawValue: packageNumber.intValue) else { return nil }
        self.package = package
        self.useByDate = useByDate.doubleValue
        self.expirationDate = expirationDate as Date
        super.init(coder: aDecoder)
    }

    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(flavor as NSString?, forKey: Keys.flavor.rawValue)
        aCoder.encode(NSNumber(value: package.rawValue), forKey: Keys.package.rawValue)
        aCoder.encode(NSNumber(value: useByDate), forKey: Keys.useByDate.rawValue)
        aCoder.encode(expirationDate as NSDate, forKey: Keys.expirationDate.rawValue)
    }

}
