import Foundation

class Sanpellegrino: Soda, Productization {
    private(set) var isPackageRenewaled: Bool
    
    init(isPackageRenewaled: Bool = true, manufactured: Date = Date()) {
        self.isPackageRenewaled = isPackageRenewaled
        super.init(brand: "Sanpellegrino S.P.A",
                   capacity: 750,
                   price: 2980,
                   name: "Sanpellegrino",
                   isZeroCalorie: true,
                   manufactured: manufactured)
    }
    
    func validate(with date: Date) -> Bool {
        return manufactured + 180 >= date
    }
    
    func isHot() -> Bool {
        return false
    }
    
    func isLowCalorie() -> Bool {
        return true
    }
}
