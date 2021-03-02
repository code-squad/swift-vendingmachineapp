import Foundation

class SeoulStrawberryMilk: Milk, Productization {
    private(set) var isWithStraw: Bool
    
    init(isWithStraw: Bool, manufactured: Date) {
        self.isWithStraw = isWithStraw
        
        super.init(brand: "서울 우유",
                   capacity: 200,
                   price: 800,
                   name: "서울 우유 딸기맛",
                   isLowFatMilk: false,
                   manufactured: manufactured)
    }
    
    convenience init() {
        self.init(isWithStraw: false, manufactured: Date())
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
