//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import Foundation

class VendingMachine: NSObject, NSCoding {
    static var shared = VendingMachine(drinks: Drinks(), chargedCoins: 0)
    private var standardHotTempertaure = 70
    private(set) var drinks: Drinks
    private var chargedCoins: Int {
        didSet {
            NotificationCenter.default.post(name: VendingMachine.updatedRemainCoins, object: self, userInfo: nil)
        }
    }
    private(set) var purchaseHistory: PurchaseHistory
    override var description: String {
        return "\(drinks)"
    }
    
    init(drinks: Drinks, chargedCoins: Int) {
        self.drinks = drinks
        self.chargedCoins = chargedCoins
        self.purchaseHistory = PurchaseHistory()
    }
    
    required init?(coder: NSCoder) {
        self.standardHotTempertaure = coder.decodeInteger(forKey: "standardHotTempertaure")
        self.drinks = coder.decodeObject(forKey: "drinks") as! Drinks
        self.chargedCoins = coder.decodeInteger(forKey: "chargedCoins")
        self.purchaseHistory = coder.decodeObject(forKey: "purchaseHistory") as! PurchaseHistory
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(standardHotTempertaure, forKey: "standardHotTempertaure")
        coder.encode(drinks, forKey: "drinks")
        coder.encode(chargedCoins, forKey: "chargedCoins")
        coder.encode(purchaseHistory, forKey: "purchaseHistory")
    }
    
    func charge(coins: Int) {
        chargedCoins += coins
    }
    
    func addStock(for drink: Drink) {
        drinks.add(drink: drink)
    }
    
    func getAvailableDrinks() -> [Drink] {
        return drinks.getAvailableDrinks(with: chargedCoins)
    }
    
    func purchase(drink: Drink.Type) {
        drinks.getAllDrinks().forEach { (key, value) in
            if key == ObjectIdentifier(drink), let instance = value.first {
                chargedCoins -= instance.price
                drinks.remove(drink: drink)
                purchaseHistory.add(drink: instance)
            }
        }
    }
    
    func checkRemainCoins() -> Int {
        return chargedCoins
    }
    
    func getAllDrinks() -> [ObjectIdentifier: [Drink]] {
        return drinks.getAllDrinks()
    }
    
    func getExpiredDrinks(date: Date) -> [Drink] {
        return drinks.getExpiredDrinks(date: date)
    }
    
    func getHotDrinks() -> [Drink] {
        return drinks.getHotDrinks(for: standardHotTempertaure)
    }
    
    func getPurchaseHistory() -> [Drink] {
        return purchaseHistory.purchasedDrinks
    }
}

extension VendingMachine {
    static let updatedDrinkStock = Notification.Name("updatedDrinkStock")
    static let updatedRemainCoins = Notification.Name("updatedRemainCoins")
    static let updatedPurchaseList = Notification.Name("updatedPurchaseList")
}
