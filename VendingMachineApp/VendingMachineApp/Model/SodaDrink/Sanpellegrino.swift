import Foundation

class Sanpellegrino: Soda, Productization {
    private(set) var isPackageRenewaled: Bool
    
    init(isPackageRenewaled: Bool = true, manufacture: Date = Date()) {
        self.isPackageRenewaled = isPackageRenewaled
        super.init(brand: "Sanpellegrino S.P.A",
                   capacity: 750,
                   price: 2980,
                   name: "Sanpellegrino",
                   isZeroCalorie: true,
                   manufacture: manufacture)
    }
    
    func validate(with date: Date) -> Bool {
        return manufacture + 180 >= date
    }
    
    func isHot() -> Bool {
        return false
    }
    
    func isLowCalorie() -> Bool {
        return true
    }
}
