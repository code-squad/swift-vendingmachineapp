import Foundation

class SeoulStrawberryMilk: Milk, Productization {
    private var isWithStraw: Bool
    
    init(brand: String, capacity: Int, price: Int, name: String, fat: Double, isWithStraw: Bool, manufactured: Date, temperature: Double, calorie: Double) {
        self.isWithStraw = isWithStraw
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   fat: fat,
                   manufactured: manufactured,
                   temperature: temperature,
                   calorie: calorie)
    }
    
    init(isWithStraw: Bool, manufactured: Date) {
        self.isWithStraw = isWithStraw
        
        super.init(brand: "서울 우유",
                   capacity: 200,
                   price: 800,
                   name: "서울 우유 딸기맛",
                   fat: 3,
                   manufactured: manufactured,
                   temperature: 7,
                   calorie: 130)
    }
    
    convenience init() {
        self.init(brand: "서울 우유",
                   capacity: 200,
                   price: 800,
                   name: "서울 우유 딸기맛",
                   fat: 3,
                   isWithStraw: true,
                   manufactured: Date(),
                   temperature: 7,
                   calorie: 130)
    }
    
    func isPastManufactured(with date: Date) -> Bool {
        return compareManufactured(during: 14, compareDate: date)
    }
}
