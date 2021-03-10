import Foundation

class Stock: NSObject, StockManageable, NSCoding {
    private var stock: [Drink]
    
    private var filePath: URL = {
            let stockDataFileName = "StockData"
            let fileManager = FileManager.default
            guard let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return URL(fileURLWithPath: "")}
            return documentDirectory.appendingPathComponent(stockDataFileName)
    }()
    
    override init() {
        self.stock = [Drink]()
        if FileManager.default.fileExists(atPath: filePath.path) {
            guard let data = FileManager.default.contents(atPath: filePath.path) else { return }
            do {
                guard let object = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Drink] else { return }
                self.stock += object
            } catch {
                print(error)
            }
        }
    }
    
    required init?(coder: NSCoder) {
        self.stock = (coder.decodeObject(forKey: "stock") as? [Drink]) ?? [Drink]()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.stock, forKey: "stock")
    }
    
    func save() {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: self.stock, requiringSecureCoding: false)
            try data.write(to: filePath)
        } catch {
            print(error)
        }
    }
    
    public func checkProductization(of drink: Drink) -> Bool {
        return (drink as? Productization) != nil ? true : false
    }

    public func addedDrink(_ drink: Drink) {
        guard checkProductization(of: drink) else { return }
        stock.append(drink)
        save()
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
        var eachStock = Dictionary<ObjectIdentifier, [Drink]>()
        for drink in stock {
            let key = ObjectIdentifier(type(of: drink))
            eachStock[key, default: [Drink]()].append(drink)
        }
        return eachStock
    }
}
