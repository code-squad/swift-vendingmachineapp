//
//  FlavoredMilk.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/03.
//

import Foundation

class FlavoredMilk: Milk {
    enum MilkFlavor: String, Codable {
        case strawberry
        case chocolate
        case banana
    }
    
    private let flavor: MilkFlavor
    
    init(volume: Int, calorie: Int, manufactured: Date?, expiredAfter: Date?, lactoseAmount: Int, flavor: MilkFlavor) {
        self.flavor = flavor
        super.init(volume: volume, calorie: calorie, manufactured: manufactured, expiredAfter: expiredAfter, lactoseAmount: lactoseAmount)
    }
    
    struct PropertyKey {
        static let flavorKey = "flavor"
    }
    
    required init?(coder: NSCoder) {
        self.flavor = (coder as! NSKeyedUnarchiver).decodeDecodable(MilkFlavor.self, forKey: "flavor") ?? .strawberry
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        try? (coder as! NSKeyedArchiver).encodeEncodable(flavor, forKey: "flavor")
        super.encode(with: coder)
    }
}
