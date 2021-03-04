import Foundation

class Stock: StockManageable {
    private var stock: [Drink]
    
    init() {
        stock = [Drink]()
    }
    
    public func checkProductization(of drink: Drink) -> Bool {
        return (drink as? Productization) != nil ? true : false
    }

    public func addedDrink(_ drink: Drink) {
        guard checkProductization(of: drink) else { return }
        stock.append(drink)
    }

    public func availableForDrinks(coin: Int) -> [Drink] {
        var availableDrinks = Set<Drink>()
        for drink in self.stock where drink.isPurchaseable(coin: coin) {
            availableDrinks.update(with: drink)
        }
        return Array(availableDrinks)
    }

    public func purchased(drinkType: Drink.Type, checkCoin: (Drink) -> Drink?) -> Drink? {
        guard let firstDrink = stock.first(where: { type(of:$0) == drinkType }) else { return nil }
        return checkCoin(firstDrink)
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
        var eachStock = Dictionary<ObjectIdentifier, [Drink]>()
        for drink in stock {
            let key = ObjectIdentifier(type(of: drink))
            eachStock[key, default: [Drink]()].append(drink)
        }
        return eachStock
    }
}
