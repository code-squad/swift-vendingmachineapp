//
//  VendinMachineAppTests.swift
//  VendinMachineAppTests
//
//  Created by user on 2021/03/05.
//

import XCTest

class FactoryTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func test_팩토리가_생성을_잘_하는지() throws {
        let beverageFactory = BeverageFactory()
        
        XCTAssertEqual(beverageFactory.makeBeverage(BananaFlavorMilk()), BananaMilk(brand: "빙그레", size: 240, price: 1400, name: "바나나맛 우유", manufactureAt: Date(), bananaMilkColor: .yellow))
        XCTAssertEqual(beverageFactory.makeBeverage(GhanaChocoMilk()), ChocoMilk(brand: "푸르밀", size: 225, price: 1000, name: "가나쵸코우유", manufactureAt: Date(), madeIn: Ghana()))
        XCTAssertEqual(beverageFactory.makeBeverage(CocaCola()), Coke(brand: "코카콜라", size: 190, price: 1500, name: "코카콜라제로", package: Can(), calories: 0))
        XCTAssertEqual(beverageFactory.makeBeverage(NarangdCider()), Cider(brand: "동아오츠카", size: 500, price: 700, name: "나랑드 사이다", package: Plastic(), country: Korea()))
        XCTAssertEqual(beverageFactory.makeBeverage(WeakAmericano()), Americano(brand: "맥심", size: 380, price: 2000, name: "TOP 아메리카노", temperature: 5, country: Ethiopia(), shot: 1))
        XCTAssertEqual(beverageFactory.makeBeverage(StrongAmericano()), Americano(brand: "맥심", size: 380, price: 2000, name: "TOP 블랙커피", temperature: 90, country: Ethiopia(), shot: 3))
        XCTAssertEqual(beverageFactory.makeBeverage(LetsBeLatte()), Latte(brand: "롯데", size: 175, price: 500, name: "레쓰비 모카라떼", temperature: 1, country: Korea(), calories: 300))
    }
}

