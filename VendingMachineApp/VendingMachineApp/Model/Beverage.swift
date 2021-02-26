import Foundation

class Beverage {
    
    private var brand: Brand.Name
    private var volume: Int
    private var price: Int
    private var productName: String
    private var manufacturedDay: Date
    private var sellByDate: Date
    private var lowCalories: Bool
    private var isHot: Bool
    
    init(brand:Brand.Name, volume: Int, price: Int, productName: String, manufacturedDay: Date, sellByDate: Date, lowCalories: Bool, isHot: Bool) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.productName = productName
        self.manufacturedDay = manufacturedDay
        self.sellByDate = sellByDate
        self.lowCalories = lowCalories
        self.isHot = isHot
    }
    
    private func dateToString(with date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMDD"
        return dateFormatter.string(from: date)
    }
    
    func checkPrice() -> Int {
        return price
    }
    
    func canbuy() -> String {
        return productName
    }
    
}

extension Beverage: CustomStringConvertible {
    var description: String {
        return "제조사: \(brand), 용량: \(volume)ml, 가격: \(price)원, 제품명: \(productName), 제조일자: \(dateToString(with: manufacturedDay)), 유통기한: \(dateToString(with: sellByDate)), 저칼로리: \(lowCalories), Hot: \(isHot)"
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
    
    func isHotBeverage() -> Bool {
        return isHot
    }

    func isLowCalorie() -> Bool {
        return lowCalories
    }
}

extension Beverage: Equatable {
    
    public static func == (lhs: Beverage, rhs: Beverage) -> Bool {
        return lhs.canbuy() == rhs.canbuy()
    }
}
