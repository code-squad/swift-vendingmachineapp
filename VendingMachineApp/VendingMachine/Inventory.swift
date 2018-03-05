//
//  Inventory.swift
//  VendingMachine
//
//  Created by jack on 2018. 1. 23..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct Inventory {
    private var invetoryBox: [ObjectIdentifier: [Beverage]] = [:]
    let kindsOfMilk: [ObjectIdentifier] = [StrawberryMilk.getKind(), BananaMilk.getKind(), ChocolateMilk.getKind()]
    let kindsOfCoffee: [ObjectIdentifier] = [TOPCoffee.getKind(), Cantata.getKind(), Georgia.getKind()]

    init(_ productsBox: [Beverage]) {
        for oneProduct in productsBox {
            self.addBeverage(oneProduct)
        }
    }

    mutating func addBeverage(_ product: Beverage) {
        if self.invetoryBox.index(forKey: ObjectIdentifier(type(of: product).self)) == nil {
            self.invetoryBox.updateValue([product], forKey: ObjectIdentifier(type(of: product).self))
            return
        }
        self.invetoryBox[ObjectIdentifier(type(of: product).self)]?.append(product)
    }

    mutating func removeBeverage(_ product: ObjectIdentifier) -> Beverage? {
        return self.invetoryBox[product]?.removeFirst()
    }

    func generateListOfValidProduct(_ currentBalance: Int) -> [ObjectIdentifier] {
        return self.invetoryBox.filter({$0.value.count > 0}).filter({
            ($0.value[0].price) < currentBalance
        }).map({$0.key})
    }

    func generateListOfProduct() -> [ObjectIdentifier] {
        return self.invetoryBox.filter({$0.value.count > 0}).map({$0.key})
    }

    func generateBeverageFromProductName(_ productName: ObjectIdentifier) -> Beverage? {
        return self.invetoryBox[productName]?.last
    }

    func generateInvalidProducts() -> [Beverage] {
        let milkProducts =  self.invetoryBox.map({$0.value.filter({
            self.kindsOfMilk.contains(ObjectIdentifier(type(of: $0)))})
        })
        let invalidProducts = milkProducts.map({$0.filter({($0 as? Milk)?.validate(with: Date()) == false})})
        return Array(invalidProducts.filter({!$0.isEmpty}).joined())
    }

    func generateHotProducts() -> [Beverage] {
        let coffeeProducts = self.invetoryBox.map({$0.value.filter({
            self.kindsOfCoffee.contains(ObjectIdentifier(type(of: $0)))})
        })
        let hotProducts = coffeeProducts.map({$0.filter({(($0 as? Coffee)?.isHot()) ?? false})})
        return Array(hotProducts.filter({$0.isEmpty == false}).joined())
    }

    func generateCountOfProduct(_ productName: ObjectIdentifier) -> Int {
        return (self.invetoryBox[productName] ?? []).count
    }
}
