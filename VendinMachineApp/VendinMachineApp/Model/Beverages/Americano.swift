
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
    
    func isMoreThan(shot: Int) -> Bool {
        return self.shot > shot
    }
}
