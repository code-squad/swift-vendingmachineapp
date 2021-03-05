
import Foundation

protocol BeverageMaking {
    func create() -> Beverage
}

class BeverageFactory {
    func makeBeverage(_ beverage: BeverageMaking) -> Beverage {
        beverage.create()
    }
}

class BananaFlavorMilk : BeverageMaking {
    func create() -> Beverage {
        return BananaMilk(brand: "빙그레", size: 240, price: 1400, name: "바나나맛 우유", manufactureAt: Date(), bananaMilkColor: .yellow)
    }
}

class GhanaChocoMilk : BeverageMaking {
    func create() -> Beverage {
        return ChocoMilk(brand: "푸르밀", size: 225, price: 1000, name: "가나쵸코우유", manufactureAt: Date(), madeIn: Ghana())
    }
}

class CocaCola : BeverageMaking {
    func create() -> Beverage {
        return Coke(brand: "코카콜라", size: 190, price: 1500, name: "코카콜라제로", package: Can(), calories: 0)
    }
}

class NarangdCider : BeverageMaking {
    func create() -> Beverage {
        return Cider(brand: "동아오츠카", size: 500, price: 700, name: "나랑드 사이다", package: Plastic(), country: Korea())
    }
}

class WeakAmericano : BeverageMaking {
    func create() -> Beverage {
        return Americano(brand: "맥심", size: 380, price: 2000, name: "TOP 아메리카노", temperature: 5, country: Ethiopia(), shot: 1)
    }
}

class StrongAmericano : BeverageMaking {
    func create() -> Beverage {
        return Americano(brand: "맥심", size: 380, price: 2000, name: "TOP 블랙커피", temperature: 90, country: Ethiopia(), shot: 3)
    }
}

class LetsBeLatte : BeverageMaking {
    func create() -> Beverage {
        return Latte(brand: "롯데", size: 175, price: 500, name: "레쓰비 모카라떼", temperature: 1, country: Korea(), calories: 300)
    }
}
