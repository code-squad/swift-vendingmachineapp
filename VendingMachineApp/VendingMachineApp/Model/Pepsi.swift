import Foundation

class Pepsi: Soda{
    // http://bitcdn.bit-play.com/fromchina/2018/09/19/20/2653a175db83ee96d20bdfbc9b2bbda3_2181504_450.jpg
    enum Flavor {
        case original
        case blue
    }
    
    private(set) var flavor: Flavor
    
    init(brand: String, capacity: Int, price: Int, name: String, isZeroCalorie: Bool, flavor: Flavor, isPackageRenewal: Bool, manufacture: Date = Date()) {
        self.flavor = flavor
        super.init(brand: brand, capacity: capacity, price: price, name: name, isZeroCalorie: isZeroCalorie, manufacture: manufacture)
    }
}
