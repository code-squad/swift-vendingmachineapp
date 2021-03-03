
import Foundation

class Coffee : Beverage, Hotable, Country {
    
    private var temperature: Int
    private var country: Country
    override var description: String {
        return "\(super.description), 원산지: \(country)"
    }
    
    init(brand: String, size: Int, price: Int, name: String, manufactureAt: Date, temperature: Int, country: Country) {
        self.temperature = temperature
        self.country = country
        super.init(brand: brand, size: size, price: price, name: name, manufactureAt: manufactureAt)
    }
    
    func isHot(standard: Int) -> Bool {
        return self.temperature > standard ? true : false
    }
    
    func madeIn() -> Country {
        return self.country
    }
}
