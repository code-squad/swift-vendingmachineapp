
import Foundation

class BananaMilk : Milk {

    enum BananaMilkColor {
        case yellow
        case white
    }
    
    private var bananaMilkColor: BananaMilkColor
    
    init(brand: String, size: Int, price: Int, name: String, manufactureAt: Date, validWithin days: Int, bananaMilkColor: BananaMilkColor) {
        self.bananaMilkColor = bananaMilkColor
        super.init(brand: brand, size: size, price: price, name: name, manufactureAt: manufactureAt, validWithin: days)
    }
    
    convenience init(brand: String, size: Int, price: Int, name: String, manufactureAt: Date, bananaMilkColor: BananaMilkColor) {
        self.init(brand: brand, size: size, price: price, name: name, manufactureAt: manufactureAt, validWithin: 3, bananaMilkColor: bananaMilkColor)
    }
    
    class override func makeBeverage() -> Beverage {
        return BananaMilk(brand: "빙그레", size: 240, price: 1400, name: "바나나맛 우유", manufactureAt: Date(), bananaMilkColor: .yellow)
    }
    
    func isEqual(color: BananaMilkColor) -> Bool {
        return self.bananaMilkColor == color ? true : false
    }
    
}
