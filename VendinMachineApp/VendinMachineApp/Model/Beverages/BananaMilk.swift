
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
    
    func isRealBananaMilk() -> Bool {
        return self.bananaMilkColor == .yellow ? true : false
    }
    
}
