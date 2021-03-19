//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import Foundation

class Beverage: NSObject, NSCoding, SafelyDrinkable {
    private(set) var volume: Int
    private let calorie: Int
    private let manufactured: Date?
    private let expiredAfter: Date?
    
    init(volume: Int, calorie: Int, manufactured: Date?, expiredAfter: Date?) {
        self.volume = volume
        self.calorie = calorie
        self.manufactured = manufactured
        self.expiredAfter = expiredAfter
    }
    
    struct PropertyKey {
        static let volumeKey = "volume"
        static let calorieKey = "calorie"
        static let manufacturedKey = "manufactured"
        static let expiredAfterKey = "expiredAfter"
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(volume, forKey: PropertyKey.volumeKey)
        coder.encode(calorie, forKey: PropertyKey.calorieKey)
        coder.encode(manufactured, forKey: PropertyKey.manufacturedKey)
        coder.encode(expiredAfter, forKey: PropertyKey.expiredAfterKey)
    }
    
    required init?(coder: NSCoder) {
        self.volume = coder.decodeInteger(forKey: PropertyKey.volumeKey)
        self.calorie = coder.decodeInteger(forKey: PropertyKey.calorieKey)
        self.manufactured = coder.decodeObject(forKey: PropertyKey.manufacturedKey) as? Date ?? Date()
        self.expiredAfter = coder.decodeObject(forKey: PropertyKey.expiredAfterKey) as? Date ?? Date()
    }
    
    public override func isEqual(_ other: Any?) -> Bool {
        guard let other = other as? Beverage else { return false }
        return self.volume == other.volume && self.calorie == other.calorie && self.manufactured == other.manufactured && self.expiredAfter == other.expiredAfter
    }
    
    public override var hash: Int {
        var hasher = Hasher()
        hasher.combine(volume)
        hasher.combine(calorie)
        hasher.combine(manufactured)
        hasher.combine(expiredAfter)
        return hasher.finalize()
    }
    
    func isStillEdible(at date: Date) -> Bool {
        if let expiredAfter = expiredAfter {
            return expiredAfter >= date
        }
        return false
    }
    
    func isSameBeverageType(with beverage: Beverage) -> Bool {
        return self.volume == beverage.volume && self.calorie == beverage.calorie
    }
}
