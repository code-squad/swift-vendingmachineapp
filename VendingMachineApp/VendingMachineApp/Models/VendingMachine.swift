//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import Foundation

class VendingMachine: NSObject, NSCoding {
    enum NotificationName {
        static let updatedDrinkStock = Notification.Name("updatedDrinkStock")
        static let updatedRemainCoins = Notification.Name("updatedRemainCoins")
        static let updatedPurchaseList = Notification.Name("updatedPurchaseList")
    }
    
    static var shared = VendingMachine(drinks: Drinks(), chargedCoins: 0)
    private var standardHotTempertaure = 70
    private var drinks: Drinks
    private var chargedCoins: Int {
        didSet {
            NotificationCenter.default.post(name: VendingMachine.NotificationName.updatedRemainCoins, object: self, userInfo: nil)
        }
    }
    private var purchaseHistory: PurchaseHistory
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
    
    func getAvailableDrinks() -> [Drink] {
        return drinks.getAvailableDrinks(with: chargedCoins)
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
    
    func post() {
        let userInfo = ["stock": getAllDrinks()]
        NotificationCenter.default.post(name: VendingMachine.NotificationName.updatedDrinkStock, object: self, userInfo: userInfo)
    }
}

extension VendingMachine: AdminMode {
    func add(for drink: Drink) {
        drinks.add(drink: drink)
        post()
    }
}

extension VendingMachine: UserMode {
    func purchase(for drink: Drink.Type) {
        drinks.getAllDrinks().forEach { (key, value) in
            if key == ObjectIdentifier(drink), let instance = value.first, let last = getPurchaseHistory().last {
                chargedCoins -= instance.price
                drinks.remove(drink: drink)
                purchaseHistory.add(drink: instance)
                post()
                let userInfo = ["drinkInfo": last]
                NotificationCenter.default.post(name: VendingMachine.NotificationName.updatedPurchaseList, object: self, userInfo: userInfo)
            }
        }
    }
}
