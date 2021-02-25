//
//  Drink.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/23.
//

import Foundation

class Drink: CustomStringConvertible, Hashable {
    
    var hashValue: Int {
        return brand.hashValue ^ charge.hashValue ^ manufacturing.hashValue ^ name.hashValue ^ volume.hashValue &* 16777619
    }
    
    
    static func == (lhs: Drink, rhs: Drink) -> Bool {
        return lhs.brand == rhs.brand &&
            lhs.charge == rhs.charge &&
            lhs.manufacturing == rhs.manufacturing &&
            lhs.name == rhs.name &&
            lhs.volume == lhs.volume
    }
    
    var description: String {
        return "\(brand), \(volume)ml, \(charge)원, \(name), \(manufacturing.convertToString())"
    }
    
    private let brand: String
    private let volume: Int
    private let charge: Int
    private let name: String
    private let manufacturing: Date
    
    init(brand : String, volume : Int, charge : Int, name :String, manufacturing : Date) {
        self.brand = brand
        self.volume = volume
        self.charge = charge
        self.name = name
        self.manufacturing = manufacturing
    }
    
    func afterManufacuring(days : Int) -> Date {
        return Date.init(timeInterval: TimeInterval(days * 3600 * 24), since: manufacturing)
    }
    
    /// 지금과, date를 second까지 비교, date가 더 미래라면 true, else = false. 낮은 경우의 수로 지금과 date가 동일 시간이어도, false로 처리함.
    func compareNowWith(date : Date) -> Bool {
        var bool = false
        if Date.init().compare(date) == .orderedAscending {
            bool = true
        }
        
        return bool
    }
    
    func canBuy(have money : Int) -> Bool {
        return self.charge < money
    }
    
    func isSameName(with product: Drink) -> Bool {
        return self.name == product.name
    }
    
    func payFor(with money : Int) -> Int {
        return money - charge
    }
}
