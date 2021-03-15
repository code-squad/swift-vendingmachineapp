
import Foundation

class BananaMilk : Milk {

    enum BananaMilkColor : Int{
        case yellow = 1
        case white = 2
    }
    
    private var bananaMilkColor: Int
    
    init(brand: String, size: Int, price: Int, name: String, manufactureAt: Date, validWithin days: Int, bananaMilkColor: BananaMilkColor.RawValue) {
        self.bananaMilkColor = bananaMilkColor
        super.init(brand: brand, size: size, price: price, name: name, manufactureAt: manufactureAt, validWithin: days)
    }
    
    convenience init(brand: String, size: Int, price: Int, name: String, manufactureAt: Date, bananaMilkColor: BananaMilkColor.RawValue) {
        self.init(brand: brand, size: size, price: price, name: name, manufactureAt: manufactureAt, validWithin: 3, bananaMilkColor: bananaMilkColor)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(self.bananaMilkColor, forKey: "bananaMilkColor")
        super.encode(with: coder)
    }
    
    required init?(coder: NSCoder) {
        self.bananaMilkColor = coder.decodeInteger(forKey: "bananaMilkColor")
        super.init(coder: coder)
    }
    
    class override func makeBeverage() -> Beverage {
        return BananaMilk(brand: "빙그레", size: 240, price: 1400, name: "바나나맛 우유", manufactureAt: Date(), bananaMilkColor: BananaMilkColor.yellow.rawValue)
    }
    
    func isEqual(color: BananaMilkColor) -> Bool {
        return self.bananaMilkColor == color.rawValue ? true : false
    }
    
}
