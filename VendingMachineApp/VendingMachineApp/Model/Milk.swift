import Foundation

class Milk: Beverage {
    
    private var farmCode: String
    
    init(brand: Brand.Name, volume: Int, price: Int, productName: String, manufacturedDay: Date, sellByDate: Date, lowCalories: Bool, isHot: Bool, farmCode: String) {
        self.farmCode = farmCode
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay, sellByDate: sellByDate, lowCalories: lowCalories, isHot: isHot)
    }
    
    func origin() -> String {
        return farmCode
    }
    
}
