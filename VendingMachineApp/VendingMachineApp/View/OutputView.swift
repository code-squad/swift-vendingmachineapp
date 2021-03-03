//
//  OutputView.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/23.
//

import Foundation

struct OutputView {
    func test_Drink() {
        let testChocoMilk = BeverageFactory.shared().getBeverage(DrinkType: ChocoMilk.self) as! ChocoMilk
        print(testChocoMilk)
        print("isRealCholate: \(testChocoMilk.isRealCholate())")

        let testStrawBerryMilk = BeverageFactory.shared().getBeverage(DrinkType: StrawberryMilk.self) as! StrawberryMilk
        print(testStrawBerryMilk)
        print("isCochineal: \(testStrawBerryMilk.isCochineal())")
        print("validate: \(testStrawBerryMilk.isWithInExpiration())")

        let testCola = BeverageFactory.shared().getBeverage(DrinkType: Cola.self) as! Cola
        print(testCola)
        print("isUnsweetened: \(testCola.isUnsweetened())")

        let testCider = BeverageFactory.shared().getBeverage(DrinkType: Cider.self) as! Cider
        print(testCider)
        print("productCalorie: \(testCider.productCalorie())")
        print("packingMaterial: \(testCider.packingMaterial())")

        let testTOP = BeverageFactory.shared().getBeverage(DrinkType: TOP.self) as! TOP
        print(testTOP)
        print("isHot: \(testTOP.isHot())")
        if testTOP.productCaffeine() < 10.0 {
            print("\(testTOP.name) is deCaffeine")
        }
        else {
            print("productCaffeine: \(testTOP.productCaffeine())ml")
        }


        let testCantata = BeverageFactory.shared().getBeverage(DrinkType: Cantata.self) as! Cantata
        print(testCantata)
        print("productCalorie: \(testCantata.productBeans())")
        if testCantata.productCaffeine() < 10.0 {
            print("\(testCantata.name) is deCaffeine")
        }
        else {
            print("productCaffeine: \(testCantata.productCaffeine())ml")
        }
    }

    func test_Machine() {
        var testMachine = VendingMachine()
        print("money : \(testMachine.checkMoney())")
        testMachine.insertMoney(howMuch: 1000)
        print("money : \(testMachine.checkMoney())")
        for _ in 0...4 {
            testMachine.addStock(what: BeverageFactory.shared().getBeverage(DrinkType: ChocoMilk.self))
            testMachine.addStock(what: BeverageFactory.shared().getBeverage(DrinkType: StrawberryMilk.self))
            testMachine.addStock(what: BeverageFactory.shared().getBeverage(DrinkType: Cola.self))
            testMachine.addStock(what: BeverageFactory.shared().getBeverage(DrinkType: Cider.self))
            testMachine.addStock(what: BeverageFactory.shared().getBeverage(DrinkType: TOP.self))
            testMachine.addStock(what: BeverageFactory.shared().getBeverage(DrinkType: Cantata.self))
        }
        print("stock : \(testMachine.showStock())")
        print("hot is : \(testMachine.hotDrinks())")
        print("expiredStock : \(testMachine.expiredStock())")
        print("availableList : \(testMachine.availableList())")
        testMachine.buyProduct(what: StrawberryMilk.self)
        print("purchased : \(testMachine.purchasedList())")
        print("money : \(testMachine.checkMoney())")

    }
}
