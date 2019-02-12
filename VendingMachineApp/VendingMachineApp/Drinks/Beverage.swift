//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by 윤동민 on 16/01/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

class Beverage: NSObject, NSCoding {
    var name: String
    var brand: String
    var volume: Int
    var price: Int
    var menufactureOfDate: Date
    
    init(name: String, volume: Int, price: Int, brand: String, date: String) {
        self.name = name
        self.brand = brand
        self.volume = volume
        self.price = price
        self.menufactureOfDate = DateFormat.convertDate(date)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(brand, forKey: "brand")
        aCoder.encode(volume, forKey: "volume")
        aCoder.encode(price, forKey: "price")
        aCoder.encode(menufactureOfDate, forKey: "menufactureOfDate")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObject(forKey: "name") as? String ?? ""
        self.brand = aDecoder.decodeObject(forKey: "brand") as? String ?? ""
        self.volume = aDecoder.decodeInteger(forKey: "volume")
        self.price = aDecoder.decodeInteger(forKey: "price")
        self.menufactureOfDate = aDecoder.decodeObject(forKey: "menufactureOfDate") as? Date ?? Date()
    }
    
    func convertToImageName() -> String {
        return ""
    }
    
    func convertToKey() -> String {
        return ""
    }
}
