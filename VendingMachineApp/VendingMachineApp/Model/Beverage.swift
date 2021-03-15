import Foundation

class Beverage: NSObject, NSCoding{
    
    private var brand: String
    private var volume: Int
    private(set) var price: Int
    private(set) var productName: String
    private var manufacturedAt: Date
    private var sellByDate: Date
    private var calories: Int
    private var temparature: Int
    
    init(brand:String, volume: Int, price: Int, productName: String, manufacturedDay: Date, sellByDate: Date, calories: Int, temparature: Int) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.productName = productName
        self.manufacturedAt = manufacturedDay
        self.sellByDate = sellByDate
        self.calories = calories
        self.temparature = temparature
    }
    
    required init?(coder: NSCoder) {
        brand = coder.decodeObject(forKey: "brand") as! String
        volume = coder.decodeInteger(forKey: "volume")
        price = coder.decodeInteger(forKey: "price")
        productName = coder.decodeObject(forKey: "productName") as! String
        manufacturedAt = coder.decodeObject(forKey: "manufacturedAt") as? Date ?? Date()
        sellByDate = coder.decodeObject(forKey: "sellByDate") as! Date
        calories = coder.decodeInteger(forKey: "calories")
        temparature = coder.decodeInteger(forKey: "temparature")
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(brand, forKey: "brand")
        coder.encode(volume, forKey: "volume")
        coder.encode(price, forKey: "price")
        coder.encode(productName, forKey: "productName")
        coder.encode(manufacturedAt, forKey: "manufactruedAt")
        coder.encode(sellByDate, forKey: "sellByDate")
        coder.encode(calories, forKey: "calories")
        coder.encode(temparature, forKey: "temparature")
    }
    
    func affordableForBeverage(money: InsertedMoney) -> Bool {
        return money.compareMoney(to: price)
    }
    
//    static func affordableBeverage(money: InsertedMoney) -> Bool {
//        return money.compareInsertedMoneyToPrice(price: )
//    }
    
    func sellingBeverageList(compare product: String) -> Bool {
        return product == productName ? true : false
    }
    
}

extension Beverage {
    override var description: String {
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

extension Beverage {
    
    public static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return type(of: lhs) == type(of: rhs) && lhs.productName == rhs.productName
    }
}

extension Beverage {
    
    private func dateToString(with date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMDD"
        return dateFormatter.string(from: date)
    }
    
}
