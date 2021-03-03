
import Foundation

class Soda : Beverage, Package {
    
    private var package: Package
    
    init(brand: String, size: Int, price: Int, name: String, manufactureAt: Date, package: Package) {
        self.package = package
        super.init(brand: brand, size: size, price: price, name: name, manufactureAt: manufactureAt)
    }

    func isTransparentMaterial() -> Bool {
        return self.package.isTransparentMaterial()
    }
    
}
