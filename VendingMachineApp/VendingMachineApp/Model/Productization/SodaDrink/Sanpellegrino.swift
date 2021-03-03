import Foundation

class Sanpellegrino: Soda, Productization {
    private var isPackageRenewaled: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, isZeroCalorie: Bool, isPackageRenewaled: Bool, manufactured: Date, temperature: Double, calorie: Double) {
        self.isPackageRenewaled = isPackageRenewaled
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   isZeroCalorie: isZeroCalorie,
                   manufactured: manufactured,
                   temperature: temperature,
                   calorie: calorie)
    }
    
    init(isPackageRenewaled: Bool, manufactured: Date) {
        self.isPackageRenewaled = isPackageRenewaled
        super.init(brand: "Sanpellegrino S.P.A",
                   capacity: 750,
                   price: 2980,
                   name: "Sanpellegrino",
                   isZeroCalorie: true,
                   manufactured: manufactured,
                   temperature: 7,
                   calorie: 0)
    }
    
    convenience init() {
        self.init(brand: "Sanpellegrino S.P.A",
                   capacity: 750,
                   price: 2980,
                   name: "Sanpellegrino",
                   isZeroCalorie: true,
                   isPackageRenewaled: true,
                   manufactured: Date(),
                   temperature: 7,
                   calorie: 0)
    }
    
    func validManufactured(with date: Date) -> Bool {
        return isDrinkableFromManufactured(pastDate: 180, compareDate: date)
    }
}
