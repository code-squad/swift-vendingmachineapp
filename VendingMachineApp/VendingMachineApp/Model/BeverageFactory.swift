import Foundation

struct BeverageFactory {
    private(set) var chocoMilk: Beverage
    private(set) var strawberryMilk: Beverage
    private(set) var coke: Beverage
    private(set) var sprite: Beverage
    private(set) var top: Beverage
    private(set) var cantata: Beverage
    
    init() {
        chocoMilk = Beverage(brand: .namyang, volume: 200, price: 1000, productName: "초코에몽", manufacturedDay: Date(), sellByDate: Date(), calories: 100, temparature: 0)
        strawberryMilk = Beverage(brand: .seoul, volume: 200, price: 1200, productName: "딸기꿀단지", manufacturedDay: Date(), sellByDate: Date(), calories: 110, temparature: 0)
        coke = Beverage(brand: .coca, volume: 180, price: 1300, productName: "코카콜라제로", manufacturedDay: Date(), sellByDate: Date(), calories: 0, temparature: 0)
        sprite = Beverage(brand: .coca, volume: 200, price: 1300, productName: "스프라이트", manufacturedDay: Date(), sellByDate: Date(), calories: 100, temparature: 0)
        top = Beverage(brand: .maxim, volume: 180, price: 1800, productName: "TOP", manufacturedDay: Date(), sellByDate: Date(), calories: 190, temparature: 110)
        cantata = Beverage(brand: .lotte, volume: 210, price: 1900, productName: "콘트라베이스블랙", manufacturedDay: Date(), sellByDate: Date(), calories: 90, temparature: 100)
    }
    
    
}
