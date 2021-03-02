import Foundation

class BingBananaMilk: Milk, Productization {
    enum Target: String {
        case all = ""
        case forKids = "kids"
    }
    
    private var target: Target
    
    init(target: Target, manufactured: Date) {
        self.target = target
        
        super.init(brand: "빙그레",
                   capacity: 240,
                   price: 1150,
                   name: "빙그레 바나나우유",
                   isLowFatMilk: false,
                   manufactured: manufactured)
    }
    
    convenience init() {
        self.init(target: .all, manufactured: Date())
    }
    
    func isPastManufactured(with date: Date) -> Bool {
        return compareManufactured(during: 14, compareDate: date)
    }
    
    func isHot() -> Bool {
        return false
    }
    
    func isLowCalorie() -> Bool {
        return false
    }
}
