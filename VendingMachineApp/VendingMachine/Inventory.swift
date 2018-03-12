//
//  Inventory.swift
//  VendingMachine
//
//  Created by jack on 2018. 1. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Inventory : NSObject, NSCoding {
    private var inventoryBox: [ObjectIdentifier: [Beverage]] = [:]
    let kindsOfMilk: [ObjectIdentifier] = [StrawberryMilk.getKind(), BananaMilk.getKind(), ChocolateMilk.getKind()]
    let kindsOfCoffee: [ObjectIdentifier] = [TOPCoffee.getKind(), Cantata.getKind(), Georgia.getKind()]

    init(_ productsBox: [Beverage]) {
        super.init()
        for oneProduct in productsBox {
            self.addBeverage(oneProduct)
        }
    }
    
    func encode(with aCoder: NSCoder) {
        let productsBox = Array(inventoryBox.values.filter({$0.count > 0}).joined())
        aCoder.encode(productsBox, forKey: "inventoryBox")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
        guard let inventoryBox = aDecoder.decodeObject(forKey: "inventoryBox") as? [Beverage] else { return }
        self.inventoryBox = Inventory(inventoryBox).inventoryBox
    }
    

    func addBeverage(_ product: Beverage) {
        if self.inventoryBox.index(forKey: ObjectIdentifier(type(of: product).self)) == nil {
            self.inventoryBox.updateValue([product], forKey: ObjectIdentifier(type(of: product).self))
            return
        }
        self.inventoryBox[ObjectIdentifier(type(of: product).self)]?.append(product)
    }

    func removeBeverage(_ product: ObjectIdentifier) -> Beverage? {
        return self.inventoryBox[product]?.removeFirst()
    }

    func generateListOfValidProduct(_ currentBalance: Int) -> [ObjectIdentifier] {
        return self.inventoryBox.filter({$0.value.count > 0}).filter({
            ($0.value[0].price) < currentBalance
        }).map({$0.key})
    }

    func generateListOfProduct() -> [ObjectIdentifier] {
        return self.inventoryBox.filter({$0.value.count > 0}).map({$0.key})
    }

    func generateBeverageFromProductName(_ productName: ObjectIdentifier) -> Beverage? {
        return self.inventoryBox[productName]?.last
    }

    func generateInvalidProducts() -> [Beverage] {
        let milkProducts =  self.inventoryBox.map({$0.value.filter({
            self.kindsOfMilk.contains(ObjectIdentifier(type(of: $0)))})
        })
        let invalidProducts = milkProducts.map({$0.filter({($0 as? Milk)?.validate(with: Date()) == false})})
        return Array(invalidProducts.filter({!$0.isEmpty}).joined())
    }

    func generateHotProducts() -> [Beverage] {
        let coffeeProducts = self.inventoryBox.map({$0.value.filter({
            self.kindsOfCoffee.contains(ObjectIdentifier(type(of: $0)))})
        })
        let hotProducts = coffeeProducts.map({$0.filter({(($0 as? Coffee)?.isHot()) ?? false})})
        return Array(hotProducts.filter({$0.isEmpty == false}).joined())
    }

    
    func generateCountOfProduct() -> [Int] {
        let productsInNumericalOrder = [StrawberryMilk.getKind(),BananaMilk.getKind(),PepciCoke.getKind(),
                                        Fanta.getKind(), TOPCoffee.getKind(), Georgia.getKind()]
        var countOfProducts : [Int] = []
        for oneProduct in productsInNumericalOrder {
            countOfProducts.append((inventoryBox[oneProduct]?.count) ?? 0)
        }
        return countOfProducts
    }

}
