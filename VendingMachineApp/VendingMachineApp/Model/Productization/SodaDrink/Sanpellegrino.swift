import Foundation

class Sanpellegrino: Soda, Productization {
    private var isPackageRenewaled: Bool
    
    init(isPackageRenewaled: Bool, manufactured: Date) {
        self.isPackageRenewaled = isPackageRenewaled
        super.init(brand: "Sanpellegrino S.P.A",
                   capacity: 750,
                   price: 2980,
                   name: "Sanpellegrino",
                   isZeroCalorie: true,
                   manufactured: manufactured)
    }
    
    convenience init() {
        self.init(isPackageRenewaled: true, manufactured: Date())
    }
    
    func isPastManufactured(with date: Date) -> Bool {
        return compareManufactured(during: 180, compareDate: date)
    }
    
    func isHot() -> Bool {
        return false
    }
    
    func isLowCalorie() -> Bool {
        return true
    }
}
