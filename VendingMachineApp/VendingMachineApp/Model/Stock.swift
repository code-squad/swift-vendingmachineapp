import Foundation

class Stock: NSObject, NSCoding, StockManageable {
    enum Notification {
        static let DidChangeStock = Foundation.Notification.Name("DidChangeStock")
    }
    
    private var stock: [Drink]
    
    override init() {
        self.stock = [Drink]()
    }
    
    required init?(coder: NSCoder) {
        self.stock = (coder.decodeObject(forKey: "stock") as? [Drink]) ?? [Drink]()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.stock, forKey: "stock")
    }
    
    public func checkProductization(of drink: Drink) -> Bool {
        return (drink as? Productization) != nil ? true : false
    }

    public func addedDrink(_ drink: Drink) {
        guard checkProductization(of: drink) else { return }
        stock.append(drink)
        NotificationCenter.default.post(name: Notification.DidChangeStock, object: nil)
    }

    public func availableForDrinks(coin: Int) -> [Drink] {
        var availableDrinks = Set<Drink>()
        for drink in self.stock where drink.isPurchaseable(coin: coin) {
            availableDrinks.update(with: drink)
        }
        return Array(availableDrinks)
    }
    
    public func purchased(drinkType: Drink.Type, insertedCoin: Int) -> Drink? {
        guard let nthDrink = stock.enumerated().first(where: { type(of:$0.element) == drinkType }) else { return nil }
        let drink = nthDrink.element
        let index = nthDrink.offset
        guard drink.isPurchaseable(coin: insertedCoin) else { return nil }
        stock.remove(at: index)
        return drink
    }

    public func lookingForExpiredDrinks() -> [Drink] {
        var disuseStock = Array<Drink>()
        for drink in self.stock {
            guard let drinkProduct = drink as? Productization else { continue }
            let now = Date()
            if drinkProduct.validManufactured(with: now) {
                disuseStock.append(drink)
            }
        }
        return disuseStock
    }

    public func lookingForWarmDrinks() -> [Drink] {
        var warmDrinks = Array<Drink>()
        for drink in stock {
            guard let drinkProduct = drink as? Productization else { continue }
            if drinkProduct.isHot() {
                warmDrinks.append(drink)
            }
        }
        return warmDrinks
    }
    
    
    public func toShowStock() -> [ObjectIdentifier: [Drink]] {
        return stock.reduce(Dictionary<ObjectIdentifier, [Drink]>()) { accumulator, drink in
                var result = accumulator
                result[ObjectIdentifier(type(of: drink)), default: [Drink]()].append(drink)
                return result
            }
    }
}
