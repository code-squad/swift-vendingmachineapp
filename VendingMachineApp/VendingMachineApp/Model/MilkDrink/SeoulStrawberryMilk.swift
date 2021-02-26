import Foundation

class SeoulStrawberryMilk: Milk, Productization {
    private(set) var isWithStraw: Bool
    
    
    init(isWithStraw: Bool = true, manufacture: Date = Date()) {
        self.isWithStraw = isWithStraw
        
        super.init(brand: "서울 우유",
                   capacity: 200,
                   price: 800,
                   name: "서울 우유 딸기맛",
                   isLowFatMilk: false,
                   manufacture: manufacture)
    }
    
    func validate(with date: Date) -> Bool {
        return manufacture - 14 < date
    }
    
    func isHot() -> Bool {
        return false
    }
    
    func isLowCalorie() -> Bool {
        return false
    }
}
