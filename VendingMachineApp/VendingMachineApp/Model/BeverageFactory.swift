import Foundation

struct BeverageFactory {
    private(set) var chocoMilk: Beverage
    private(set) var strawberryMilk: Beverage
    private(set) var coke: Beverage
    private(set) var sprite: Beverage
    private(set) var top: Beverage
    private(set) var cantata: Beverage
    
    init() {
        chocoMilk = ChocolateMilk(brand: "남양유업", volume: 200, price: 1000, productName: "초코에몽", manufacturedDay: Date(), sellByDate: Date(), calories: 100, temparature: 0, farmCode: "f1234", additive: "Chocolate")
        strawberryMilk = StrawBerryMilk(brand: "서울우유", volume: 180, price: 1200, productName: "딸기꿀단지", manufacturedDay: Date(), sellByDate: Date(), calories: 110, temparature: 0, farmCode: "f1243", additive: "Strawberry")
        coke = Coke(brand: "코카콜라", volume: 200, price: 1300, productName: "코카콜라제로", manufacturedDay: Date(), sellByDate: Date(), calories: 0, temparature: 0, zeroCalories: true, flavor: "original")
        sprite = Sprite(brand: "코카콜라", volume: 340, price: 1800, productName: "스프라이트", manufacturedDay: Date(), sellByDate: Date(), calories: 80, temparature: 0, zeroCalories: false, container: "bottle")
        top = Top(brand: "맥심", volume: 180, price: 1500, productName: "TOP", manufacturedDay: Date(), sellByDate: Date(), calories: 100, temparature: 100, decaffeinated: false, dairyProducts: true)
        cantata = Cantata(brand: "롯데칠성", volume: 180, price: 1700, productName: "콘트라베이스블랙", manufacturedDay: Date(), sellByDate: Date(), calories: 10, temparature: 110, decaffeinated: true, dairyProducts: false)
    }
    
    
}
