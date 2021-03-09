
import Foundation

class Americano : Coffee, Shot {
    
    private var shot: Int
    
    init(brand: String, size: Int, price: Int, name: String, manufactureAt: Date, temperature: Int, country: Country, shot: Int) {
        self.shot = shot
        super.init(brand: brand, size: size, price: price, name: name, manufactureAt: manufactureAt, temperature: temperature, country: country)
    }
    
    convenience init(brand: String, size: Int, price: Int, name: String, temperature: Int, country: Country, shot: Int) {
        self.init(brand: brand, size: size, price: price, name: name, manufactureAt: Date(), temperature: temperature, country: country, shot: shot)
    }
    
    class override func makeBeverage() -> Beverage {
        return Americano(brand: "맥심", size: 380, price: 2000, name: "TOP 아메리카노", temperature: 5, country: Ethiopia(), shot: 1)
    }
    
    func isMoreThan(shot: Int) -> Bool {
        return self.shot > shot
    }
}
