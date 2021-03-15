
import Foundation

class ChocoMilk : Milk, Country {
    private var country: CountryOfOrigin
    override var description: String {
        return "\(super.description), 원산지: \(country)"
    }
    
    init(brand: String, size: Int, price: Int, name: String, manufactureAt: Date, validWithin days: Int, madeIn: String) {
        self.country = CountryOfOrigin(name: madeIn)
        super.init(brand: brand, size: size, price: price, name: name, manufactureAt: manufactureAt, validWithin: days)
    }
    
    convenience init(brand: String, size: Int, price: Int, name: String, manufactureAt: Date, madeIn: String) {
        self.init(brand: brand, size: size, price: price, name: name, manufactureAt: manufactureAt, validWithin: 7, madeIn: madeIn)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(self.country, forKey: "chocoMilkCountry")
        super.encode(with: coder)
    }
    
    required init?(coder: NSCoder) {
//        let nameOfCountry = coder.decodeObject(forKey: "chocoMilkCountry") as! String
//        self.country = CountryFactory.decode(country: nameOfCountry)
//        self.country = coder.decodeObject(forKey: "chocoMilkCountry") as! Country
        self.country = coder.decodeObject(forKey: "chocoMilkCountry") as! CountryOfOrigin
        super.init(coder: coder)
    }
    
    class override func makeBeverage() -> Beverage {
        return ChocoMilk(brand: "푸르밀", size: 225, price: 1000, name: "가나쵸코우유", manufactureAt: Date(), madeIn: "한국")
    }
    
    func nameOfCountry() -> String {
        return self.country.nameOfCountry()
    }
}
