//
//  OutputView.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/23.
//

import Foundation

struct OutputView {
    func test_Drink() {
        let testChocoMilk = ChocoMilk.init()
        print(testChocoMilk)
        print("isRealCholate: \(testChocoMilk.isRealCholate())")
        
        let testStrawBerryMilk = StrawberryMilk.init()
        print(testStrawBerryMilk)
        print("isCochineal: \(testStrawBerryMilk.isCochineal())")
        print("validate: \(testStrawBerryMilk.validate())")
        
        let testCola = Cola()
        print(testCola)
        print("isUnsweetened: \(testCola.isUnsweetened())")
        
        let testCider = Cider()
        print(testCider)
        print("productCalorie: \(testCider.productCalorie())")
        print("packingMaterial: \(testCider.packingMaterial())")
        
        let testTOP = TOP()
        print(testTOP)
        print("isHot: \(testTOP.isHot())")
        print("productCaffeine: \(testTOP.productCaffeine())")
        
        let testCantata = Cantata()
        print(testCantata)
        print("productCalorie: \(testCantata.productBeans())")
        print("productCaffeine: \(testCantata.productCaffeine())")
        
    }
    
    func test_Machine() {
        var testMachine = VendingMachine()
        print("money : \(testMachine.checkMoney())")
        testMachine.insertMoney(howMuch: 1000)
        print("money : \(testMachine.checkMoney())")
        for _ in 0...4 {
            testMachine.addStock(what: StrawberryMilk.init())
            testMachine.addStock(what: Cola.init())
            testMachine.addStock(what: Cider.init())
            testMachine.addStock(what: Cantata.init())
            testMachine.addStock(what: ChocoMilk.init())
            testMachine.addStock(what: TOP.init())
        }
        print("stock : \(testMachine.showStock())")
        print("hot is : \(testMachine.hotDrinks())")
        print("expiredStock : \(testMachine.expiredStock())")
        print("availableList : \(testMachine.availableList())")
        testMachine.buyProduct(what: StrawberryMilk.self)
        print("purchased : \(testMachine.purchasedList())")
        
    }
}
