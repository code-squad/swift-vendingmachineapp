
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
 
    func madeIn() -> Country {
        return self.country
    }
}

