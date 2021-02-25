import Foundation

class Milk: Beverage {
    
    private var farmCode: String
    private var sellByDate: Date
    
    init(brand: Brand.Name, volume: Int, price: Int, productName: String, manufacturedDay: Date, farmCode: String, sellByDate: Date) {
        self.farmCode = farmCode
        self.sellByDate = sellByDate
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay)
    }
    
    func origin() -> String {
        return farmCode
    }
    
}
