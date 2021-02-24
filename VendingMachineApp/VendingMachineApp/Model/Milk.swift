import Foundation

class Milk: Beverage {
    
    private var farmCode: String
    
    init(brand: Brand.Name, volume: Int, price: Int, name: String, manufacturedDay: Date, farmCode: String) {
        self.farmCode = farmCode
        super.init(brand: brand, volume: volume, price: price, productName: name, manufacturedDay: manufacturedDay)
    }
    
    func origin() -> String {
        return farmCode
    }
}
