import Foundation

class Milk: Beverage {
    
    private var farmCode: String
    
    init(brand: Brand.Name, volume: Int, price: Int, productName: String, manufacturedDay: Date, sellByDate: Date, calories: Int, temparature: Int, farmCode: String) {
        self.farmCode = farmCode
        super.init(brand: brand, volume: volume, price: price, productName: productName, manufacturedDay: manufacturedDay, sellByDate: sellByDate, calories: calories, temparature: temparature)
    }
    
    func origin() -> String {
        return farmCode
    }
    
}
