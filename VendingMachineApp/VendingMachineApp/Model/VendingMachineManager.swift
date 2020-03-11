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
