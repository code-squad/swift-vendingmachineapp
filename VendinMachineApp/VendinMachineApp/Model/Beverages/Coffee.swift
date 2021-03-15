
import Foundation

class Coffee : Beverage, Hotable, Country {
    
    private var temperature: Int
    private var country: CountryOfOrigin
    override var description: String {
        return "\(super.description), 원산지: \(country.nameOfCountry())"
    }
    
    init(brand: String, size: Int, price: Int, name: String, manufactureAt: Date, temperature: Int, country: String) {
        self.temperature = temperature
        self.country = CountryOfOrigin(name: country)
        super.init(brand: brand, size: size, price: price, name: name, manufactureAt: manufactureAt)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(self.temperature, forKey: "temperature")
        coder.encode(self.country, forKey: "coffeeCountry")
        super.encode(with: coder)
    }
    
    required init?(coder: NSCoder) {
        self.temperature = coder.decodeInteger(forKey: "temperature")
        self.country = coder.decodeObject(forKey: "coffeeCountry") as! CountryOfOrigin
        super.init(coder: coder)
    }
    
    func isHot(standard: Int) -> Bool {
        return self.temperature > standard ? true : false
    }
    
    func nameOfCountry() -> String {
        return self.country.nameOfCountry()
    }
}
