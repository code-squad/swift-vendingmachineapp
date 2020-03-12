//
//  VendingMachineManager.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/28.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import Foundation

protocol VendingMachineManagementDelegate: class {
    var stockNames: [String] { get }
    func addBalance(amount: Int)
    func addStock(index: Int)
}

class VendingMachineManager {
    private var vendingMachine = VendingMachine()
    var balance: String {
        "\(vendingMachine.checkBalance())"
    }
    var stockList: [(key: Beverage, value: Int)] {
        vendingMachine.stockList
    }
    
    init() {
        self.vendingMachine.addBeverage(beverage: StrawberryMilk(brand: "서울우유", amount: 180, price: Money(amount: 800), name: "딸기꿀단지", calorie: 145, saleablePeriod: 70, fatRatio: 9, strawberryContent: 1))
        self.vendingMachine.addBeverage(beverage: Cola(brand: "코카콜라", amount: 250, price: Money(amount: 1200), name: "코카콜라 제로", calorie: 0, saleablePeriod: 600, sugarContent: 0))
        self.vendingMachine.addBeverage(beverage: Cantata(brand: "롯데", amount: 500, price: Money(amount: 2500), name: "칸타타 콘트라베이스", calorie: 20, saleablePeriod: 150, caffeineContent: 179, isHot: false))
        self.vendingMachine.addBeverage(beverage: BananaMilk(brand: "빙그레", amount: 240, price: Money(amount: 1000), name: "바나나맛우유", calorie: 208, saleablePeriod: 90, fatRatio: 15, bananaContent: 3))
        self.vendingMachine.addBeverage(beverage: Fanta(brand: "코카콜라", amount: 250, price: Money(amount: 1000), name: "환타 오렌지", calorie: 136, saleablePeriod: 600, sugarContent: 34, flavor: "오렌지"))
    }
    
    func saveData() {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: vendingMachine, requiringSecureCoding: false)
            UserDefaults.standard.set(data, forKey: "vendingMachine")
        } catch {
            fatalError("Save failed \(error)")
        }
    }
    
    func loadData() {
        guard let loadedData = UserDefaults.standard.object(forKey: "vendingMachine") as? Data else { return }
        do {
            guard let unArchivedData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(loadedData) as? VendingMachine else { return }
            vendingMachine = unArchivedData
        } catch {
            fatalError("Unarchive failed \(error)")
        }
    }
}

extension VendingMachineManager: VendingMachineManagementDelegate {
    var stockNames: [String] {
        vendingMachine.stockList.map { $0.key.name }
    }
    
    func addBalance(amount: Int) {
        vendingMachine.addBalance(Money(amount: amount))
    }

    func addStock(index: Int) {
        vendingMachine.addBeverage(beverage: vendingMachine.stockList[index].key)
    }
}
