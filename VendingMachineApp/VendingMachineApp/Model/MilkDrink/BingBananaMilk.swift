import Foundation

class BingBananaMilk: Milk, Productization {
    enum Target: String {
        case all = ""
        case forKids = "kids"
    }
    
    private(set) var target: Target
    
    init(target: Target = .all, manufactured: Date = Date()) {
        self.target = target
        
        super.init(brand: "빙그레",
                   capacity: 240,
                   price: 1150,
                   name: "빙그레 바나나우유",
                   isLowFatMilk: false,
                   manufactured: manufactured)
    }
    
    func validate(with date: Date) -> Bool {
        return manufactured + 14 >= date
    }
    
    func isHot() -> Bool {
        return false
    }
    
    func isLowCalorie() -> Bool {
        return false
    }
}
