
import Foundation

class Soda : Beverage, Transparentable {
    
    private var transparentMaterial: Bool
    
    init(brand: String, size: Int, price: Int, name: String, manufactureAt: Date, transparentable: Bool) {
        self.transparentMaterial = transparentable
        super.init(brand: brand, size: size, price: price, name: name, manufactureAt: manufactureAt)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(self.transparentMaterial, forKey: "transparentMaterial")
        super.encode(with: coder)
    }
    
    required init?(coder: NSCoder) {
        self.transparentMaterial = coder.decodeBool(forKey: "transparentMaterial")
        super.init(coder: coder)
    }

    func isTransparentMaterial() -> Bool {
        return self.transparentMaterial
    }
}
