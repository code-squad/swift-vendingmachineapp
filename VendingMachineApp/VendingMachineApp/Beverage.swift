import Foundation

class Beverage: CustomStringConvertible {
    // MARK: Properties

    private var name: String
    private var price: Int
    private var capacity: Int
    private var brand: String
    private var productionDate: Date

    var description: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"

        return "\(brand), \(capacity)ml, \(price)원, \(name), \(dateFormatter.string(from: productionDate))"
    }


    // MARK: Methods

    init(name: String, price: Int, capacity: Int, brand: String, productionDate: Date) {
        self.name = name
        self.price = price
        self.capacity = capacity
        self.brand = brand
        self.productionDate = productionDate
    }
}
