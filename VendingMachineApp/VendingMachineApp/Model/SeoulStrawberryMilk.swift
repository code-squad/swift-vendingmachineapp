import Foundation

class SeoulStrawberryMilk: Milk {
    private(set) var isWithStraw: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, isLowFatMilk: Bool, isWithStraw: Bool, manufacture: Date = Date()) {
        self.isWithStraw = isWithStraw
        super.init(brand: brand, capacity: capacity, price: price, name: name, isLowFatMilk: isLowFatMilk, manufacture: manufacture)
    }
}
