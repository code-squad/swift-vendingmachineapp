import Foundation

class Beverage: Codable {
    
    private var brand: Brand.Name
    private var volume: Int
    private var price: Int
    private(set) var productName: String
    private var manufacturedAt: Date
    private var sellByDate: Date
    private var calories: Int
    private var temparature: Int
    
    enum BeverageCodingKey: String, CodingKey {
        case brand
        case volume
        case price
        case productName
        case manufacturedAt
        case sellByDate
        case calories
        case temparature
    }
    
    init(brand:Brand.Name, volume: Int, price: Int, productName: String, manufacturedDay: Date, sellByDate: Date, calories: Int, temparature: Int) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.productName = productName
        self.manufacturedAt = manufacturedDay
        self.sellByDate = sellByDate
        self.calories = calories
        self.temparature = temparature
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: BeverageCodingKey.self)
        brand = try values.decode(Brand.Name.self, forKey: .brand)
        volume = try values.decode(Int.self, forKey: .volume)
        price = try values.decode(Int.self, forKey: .price)
        productName = try values.decode(String.self, forKey: .productName)
        manufacturedAt = try values.decode(Date.self, forKey: .manufacturedAt)
        sellByDate = try values.decode(Date.self, forKey: .sellByDate)
        calories = try values.decode(Int.self, forKey: .calories)
        temparature = try values.decode(Int.self, forKey: .temparature)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: BeverageCodingKey.self)
        try container.encode(brand, forKey: .brand)
        try container.encode(volume, forKey: .volume)
        try container.encode(price, forKey: .price)
        try container.encode(productName, forKey: .productName)
        try container.encode(manufacturedAt, forKey: .manufacturedAt)
        try container.encode(sellByDate, forKey: .sellByDate)
        try container.encode(calories, forKey: .calories)
        try container.encode(temparature, forKey: .temparature)
    }
    
    func availableForBeverage() -> Bool {
        let machine = VendingMachine()
        return machine.insertedMoney.compareMoney(to: price) == true
    }

    func afterBuyingBeverage() {
        let machine = VendingMachine()
        machine.insertedMoney.afterBuyingProduct(minus: price)
    }
    
    func sellingBeverageList(compare product: String) -> Bool {
        return product == productName ? true : false
    }
    
}

extension Beverage: CustomStringConvertible {
    var description: String {
        return "제조사: \(brand), 용량: \(volume)ml, 가격: \(price)원, 제품명: \(productName), 제조일자: \(dateToString(with: manufacturedAt)), 유통기한: \(dateToString(with: sellByDate)), 저칼로리: \(calories), Hot: \(temparature)"
    }
}

extension Beverage: CheckBeverageInfo {
    
    func validate(with date: Date) -> Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMDD"
        formatter.locale = Locale(identifier: "ko_KR")
        let nowDate = formatter.date(from: dateToString(with: date))!
        let sellDate = formatter.date(from: dateToString(with: sellByDate))!
        switch nowDate.compare(sellDate) {
        case .orderedDescending:
            return false
        default:
            return true
        }
    }
    
    func isHotBeverage(over: Int) -> Bool {
        return temparature >= over
    }

    func isLowCalorie(under: Int) -> Bool {
        return calories <= under
    }
}

extension Beverage: Hashable {
    
    public static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return type(of: lhs) == type(of: rhs) && lhs.productName == rhs.productName
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(productName)
        hasher.combine(price)
    }
}

extension Beverage {
    
    private func dateToString(with date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMDD"
        return dateFormatter.string(from: date)
    }
    
}

