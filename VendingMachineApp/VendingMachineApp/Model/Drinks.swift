//
//  Drink.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class Drinks : NSObject, NSCoding{
    private var drinks : [Beverage]
    
    override init() {
        self.drinks = []
        super.init()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(drinks, forKey: "drinks")
    }
    
    required init?(coder: NSCoder) {
        self.drinks = coder.decodeObject(forKey: "drinks") as! [Beverage]
    }
    
    func addStock(beverage : Beverage) {
        drinks.append(beverage)
    }
    
    func showBeverageList(hanlder : (Beverage) -> Void) {
        drinks.forEach {
            hanlder($0)
        }
    }
    
    func purchasePossibleList(money : Int) -> [Beverage] {
        return drinks.filter { $0.isPossiblePurchase(money: money) }
    }
    
    func purchase(beverage : Beverage) {
        guard let index = drinks.firstIndex(where: { $0 == beverage }) else { return }
        drinks.remove(at: index)
    }
    
    func count(beverage : Beverage) -> Int {
        return drinks.filter { $0 == beverage }.count
    }
    
    func showAllBeverage() -> [ObjectIdentifier : [Beverage]] {
        return drinks.reduce(into: [:]) { metaType , beverage in
            metaType[ObjectIdentifier(type(of: beverage.self)), default : []] += [beverage]
        }
    }
    
    func passExpiryDate(standard : Date) -> [Beverage] {
        return drinks.filter { $0.isExpiryDate(with: standard) }
    }
    
    func hotDrink(standard : Int) -> [Beverage] {
        return drinks.filter { $0.isHot(standard : standard) }
    }
}
