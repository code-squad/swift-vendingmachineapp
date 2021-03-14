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
    
    public func addedDrink(_ drink: Drink) {
        guard isProductization(of: drink) else { return }
        stock.append(drink)
        NotificationCenter.default.post(name: Notification.DidChangeStock, object: nil)
    }
    
    public func availableForDrinks(coin: Int) -> [Drink] {
        return Array(Set(self.stock.filter{ $0.isPurchaseable(coin: coin) }))
    }
    
    public func purchased(drinkType: Drink.Type, insertedCoin: Int) -> Drink? {
        guard let nthDrink = findNthDrink(typeOf: drinkType) else { return nil }
        guard nthDrink.element.isPurchaseable(coin: insertedCoin) else { return nil }
        stock.remove(at: nthDrink.offset)
        return nthDrink.element
    }
    
    public func lookingForExpiredDrinks() -> [Drink] {
        return self.stock.filter{ drink in
            guard let drinkProduct = drink as? Productization else { return false }
            return drinkProduct.validManufactured(with: Date())
        }
    }
    
    public func lookingForWarmDrinks() -> [Drink] {
        return self.stock.filter{ $0.isHot() }
    }
    
    public func toShowStock() -> [ObjectIdentifier: [Drink]] {
        return stock.reduce(Dictionary<ObjectIdentifier, [Drink]>()) { accumulator, drink in
            var result = accumulator
            result[ObjectIdentifier(type(of: drink)), default: [Drink]()].append(drink)
            return result
        }
    }
}

extension Stock {
    private func isProductization(of drink: Drink) -> Bool {
        return (drink as? Productization) != nil ? true : false
    }
    
    private func findNthDrink(typeOf drinkType: Drink.Type) -> EnumeratedSequence<[Drink]>.Element? {
        return stock.enumerated().first(where: { type(of:$0.element) == drinkType })
    }
}
