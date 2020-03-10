import Foundation

class Beverage: CustomStringConvertible {
    // MARK: Properties

    private var name: String
    private var price: Int
    private var capacity: Int
    private var brand: String
    private var productionDate: ProductionDate

    var description: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"

        return "\(brand), \(capacity)ml, \(price)원, \(name), \(productionDate)"
    }


    // MARK: Methods

    init(name: String, price: Int, capacity: Int, brand: String, productionDate: ProductionDate) {
        self.name = name
        self.price = price
        self.capacity = capacity
        self.brand = brand
        self.productionDate = productionDate
    }
}

struct ProductionDate: CustomStringConvertible {
    private var date: Date
    private var dateFormatter = DateFormatter()

    var dateFormat: String {
        get {
            dateFormatter.dateFormat
        }
        set {
            dateFormatter.dateFormat = newValue
        }
    }

    var description: String {
        dateFormatter.string(from: date)
    }
}

extension ProductionDate {
    init(_ date: Date) {
        self.date = date
    }

    init?(from string: String, dateFormat: String = "yyyyMMdd") {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat

        guard let date = dateFormatter.date(from: string) else { return nil }

        self.init(date: date, dateFormatter: dateFormatter)
    }
}
