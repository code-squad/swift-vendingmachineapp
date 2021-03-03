
import Foundation

class Coffee : Beverage, Hotable {
    
    private var temperature: Int
    
    init(brand: String, size: Int, price: Int, name: String, manufactureAt: Date, temperature: Int) {
        self.temperature = temperature
        super.init(brand: brand, size: size, price: price, name: name, manufactureAt: manufactureAt)
    }
    
    func isHot(standard: Int) -> Bool {
        return self.temperature > standard ? true : false
    }
}
