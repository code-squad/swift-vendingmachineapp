
import Foundation

class Cider : Soda, Country {
    
    private var country: Country
    override var description: String {
        return "\(super.description), 원산지: \(country)"
    }
    
    init(brand: String, size: Int, price: Int, name: String, manufactureAt: Date, package: Package, country: Country) {
        self.country = country
        super.init(brand: brand, size: size, price: price, name: name, manufactureAt: manufactureAt, package: package)
    }
    
    convenience init(brand: String, size: Int, price: Int, name: String, package: Package, country: Country) {
        self.init(brand: brand, size: size, price: price, name: name, manufactureAt: Date(), package: package, country: country)
    }
 
    class override func makeBeverage() -> Beverage {
        return Cider(brand: "동아오츠카", size: 500, price: 700, name: "나랑드 사이다", package: Plastic(), country: Korea())
    }
    
    func madeIn() -> Country {
        return self.country
    }
}

