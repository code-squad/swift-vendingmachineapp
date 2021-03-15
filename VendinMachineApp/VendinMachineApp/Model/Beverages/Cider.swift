
import Foundation

class Cider : Soda, Country {
    
    private var country: CountryOfOrigin
    override var description: String {
        return "\(super.description), 원산지: \(country.nameOfCountry())"
    }
    
    init(brand: String, size: Int, price: Int, name: String, manufactureAt: Date, transparentable: Bool, country: String) {
        self.country = CountryOfOrigin(name: country)
        super.init(brand: brand, size: size, price: price, name: name, manufactureAt: manufactureAt, transparentable: transparentable)
    }
    
    convenience init(brand: String, size: Int, price: Int, name: String, transparentable: Bool, country: String) {
        self.init(brand: brand, size: size, price: price, name: name, manufactureAt: Date(), transparentable: transparentable, country: country)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(self.country, forKey: "ciderCountry")
        super.encode(with: coder)
    }
    
    required init?(coder: NSCoder) {
        self.country = coder.decodeObject(forKey: "ciderCountry") as! CountryOfOrigin
        super.init(coder: coder)
    }
 
    class override func makeBeverage() -> Beverage {
        return Cider(brand: "동아오츠카", size: 500, price: 700, name: "나랑드 사이다", transparentable: true, country: "한국")
    }
    
    func nameOfCountry() -> String {
        return self.country.nameOfCountry()
    }
}

