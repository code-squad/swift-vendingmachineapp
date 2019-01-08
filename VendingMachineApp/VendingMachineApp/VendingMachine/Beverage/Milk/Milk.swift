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
    private struct Default {
        static let flavor: NSString? = nil
        static let package: BeveragePackage = .paper
        static let packageNumber: NSNumber = package.rawValue as NSNumber
        static let useByDate: NSNumber = 10
        static let expirationDate: NSDate = Date.subtractingDaysFromNow(by: 5) as NSDate
    }

    private enum Keys: String {
        case flavor = "flavor"
        case package = "package"
        case useByDate = "useByDate"
        case expirationDate = "expirationDate"
    }

    required init?(coder aDecoder: NSCoder) {
        let flavor = aDecoder
            .decodeObject(of: NSString.self, forKey: Keys.flavor.rawValue) ?? Default.flavor
        let packageNumber = aDecoder
            .decodeObject(of: NSNumber.self, forKey: Keys.package.rawValue) ?? Default.packageNumber
        let package = BeveragePackage(rawValue: packageNumber.intValue) ?? Default.package
        let useByDate = aDecoder
            .decodeObject(of: NSNumber.self, forKey: Keys.useByDate.rawValue) ?? Default.useByDate
        let expirationDate = aDecoder
            .decodeObject(of: NSDate.self, forKey: Keys.expirationDate.rawValue) ?? Default.expirationDate
        self.flavor = flavor as String?
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
