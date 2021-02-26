import Foundation

class Sanpellegrino: Soda, BeverageDescripting {
    private(set) var isPackageRenewaled: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, isZeroCalorie: Bool, isPackageRenewal: Bool, manufacture: Date = Date()) {
        self.isPackageRenewaled = isPackageRenewal
        super.init(brand: brand, capacity: capacity, price: price, name: name, isZeroCalorie: isZeroCalorie, manufacture: manufacture)
    }
    
    
}
