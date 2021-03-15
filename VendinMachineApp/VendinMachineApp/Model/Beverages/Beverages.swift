
import Foundation

class Beverages {
    
    private var beverages: [ObjectIdentifier:[Beverage]]
    
    init() {
        self.beverages = [:]
    }
    
    func remove(elementType: Beverage.Type) -> Beverage? {
        let beverage = self.beverages[ObjectIdentifier(elementType)]?.popLast()
        return beverage
    }
    
    func priceInfo(elementType: Beverage.Type) -> Int? {
        return self.beverages[ObjectIdentifier(elementType)]?.first?.price
    }
    
    func isEmpty(elementType: Beverage.Type) -> Bool {
        return self.beverages[ObjectIdentifier(elementType)] != nil
    }
    
    func beverageCount(elementType: Beverage.Type) -> Int {
        let count = self.beverages[ObjectIdentifier(elementType)]?.count ?? 0
        return count
    }
    
    func beverageList(type: Beverage.Type) -> [Beverage] {
        guard let beverageArray = self.beverages[ObjectIdentifier(type)] else {
            return []
        }
        return beverageArray
    }
    
    func setupToDecode(beverageList: [Beverage], type: Beverage.Type) {
        self.beverages[ObjectIdentifier(type)] = beverageList
    }
    
    func addBeverage(element: Beverage) {
        if self.beverages[ObjectIdentifier(type(of: element))] == nil {
            self.beverages.updateValue([], forKey: ObjectIdentifier(type(of: element)))
        }
            self.beverages[ObjectIdentifier(type(of: element))]?.append(element)
    }
        
    func beverageList(under price: Int) -> Beverages {
        let tempBeverages = Beverages()
        
        self.beverages.forEach { (beverageType, beverageArray) in
            if let beverage = self.beverages[beverageType], beverage.first?.isPriced(under: price) == true {
                tempBeverages.beverages.updateValue(beverageArray, forKey: beverageType)
            }
        }
        return tempBeverages
    }
    
    func hotBeverageList(over temperature: Int) -> Beverages {
        let tempBeverages = Beverages()

        self.beverages.forEach { (beverageType, beverageArray) in
            if let beverage = self.beverages[beverageType], let hotBeverage = beverage as? Hotable, hotBeverage.isHot(standard: temperature) {
                tempBeverages.beverages.updateValue(beverageArray, forKey: beverageType)
            }
        }
        return tempBeverages
    }
    
    func expiredBeverageList(on Date: Date) -> Beverages {
        let tempBeverages = Beverages()

        self.beverages.forEach { (beverageType, beverageArray) in
            if let beverage = self.beverages[beverageType], let expiredBeverage = beverage as? Drinkable, expiredBeverage.isDrinkable(on: Date) {
                tempBeverages.beverages.updateValue(beverageArray, forKey: beverageType)
            }
        }
        return tempBeverages
    }
    
    func addedShotList(over shot: Int) -> Beverages {
        let tempBeverages = Beverages()

        self.beverages.forEach { (beverageType, beverageArray) in
            if let beverage = self.beverages[beverageType], let shotAddedBeverage = beverage as? Shot, shotAddedBeverage.isMoreThan(shot: shot) {
                tempBeverages.beverages.updateValue(beverageArray, forKey: beverageType)
            }
        }
        return tempBeverages
    }
    
    func sameOriginBeverageList(madeIn country: String) -> Beverages {
        let tempBeverages = Beverages()

        self.beverages.forEach { (beverageType, beverageArray) in
            if let beverage = self.beverages[beverageType], let sameOriginBeverage = beverage as? Country, country == sameOriginBeverage.nameOfCountry() {
                tempBeverages.beverages.updateValue(beverageArray, forKey: beverageType)
            }
        }
        return tempBeverages
    }
    
    func lowCalorieBeverageList(below calories: Int) -> Beverages {
        let tempBeverages = Beverages()

        self.beverages.forEach { (beverageType, beverageArray) in
            if let beverage = self.beverages[beverageType], let lowCalorieBeverage = beverage as? Calorie, lowCalorieBeverage.isLowCalories(standard: calories){
                tempBeverages.beverages.updateValue(beverageArray, forKey: beverageType)
            }
        }
        return tempBeverages
    }
    
    func beverageListOfTransparentPackage() -> Beverages {
        let tempBeverages = Beverages()

        self.beverages.forEach { (beverageType, beverageArray) in
            if let beverage = self.beverages[beverageType], let transparentBeverage = beverage as? Transparentable, transparentBeverage.isTransparentMaterial(){
                tempBeverages.beverages.updateValue(beverageArray, forKey: beverageType)
            }
        }
        return tempBeverages
    }
}
