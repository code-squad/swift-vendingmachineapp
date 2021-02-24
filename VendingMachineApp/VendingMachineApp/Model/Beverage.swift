import Foundation

class Beverage {
    
    private var brand: Brand
    private var volume: Int
    private var price: Int
    private var productName: String
    private var manufactureDate: Date
    
    init(brand:Brand, volume: Int, price: Int, productName: String, manufactureDate: Date) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.productName = productName
        self.manufactureDate = manufactureDate
    }
}
