//
//  MachineDataManager.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/03/13.
//

import Foundation

class MachineDataManager {
    private static let machineKey = "machineKey"
    
    static private func loadData() -> Machine? {
        do {
            guard let data = UserDefaults.standard.data(forKey: machineKey) else { return nil }
            let machineData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data)
            guard let tempMachine = machineData as? Machine else { return nil }
            return tempMachine
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }

    static func setMachine() -> Machine {
        let machineData = loadData()
        
        if machineData != nil {
            return machineData!
        } else {
            let newMachine = Machine()
            let someBeverage = BeverageFactory.makeBeverageWithType(brand: "동아제약", price: .high, name: "박카스", packageTime: .fresh, beverageType: Beverage.self)
            let someStrawBerryMilk = BeverageFactory.makeBeverageWithType(brand: "남양유업", price: .high, name: "딸기에몽", packageTime: .fresh, beverageType: StrawBerryMilk.self)
            let someBananaMilk = BeverageFactory.makeBeverageWithType(brand: "빙그레", price: .high, name: "바나나맛우유", packageTime: .fresh, beverageType: BananaMilk.self)
            let someCola = BeverageFactory.makeBeverageWithType(brand: "코카콜라", price: .high, name: "코카콜라", packageTime: .fresh, beverageType: Cola.self)
            let someAmericano = BeverageFactory.makeBeverageWithType(brand: "스타벅스", price: .high, name: "아메리카노-톨", packageTime: .fresh, beverageType: Americano.self)
            let someAmericano2 = BeverageFactory.makeBeverageWithType(brand: "스타벅스", price: .high, name: "콜드브루블랙", packageTime: .fresh, beverageType: Americano.self)
            
            newMachine.addStock(beverage: someBeverage, amount: 10)
            newMachine.addStock(beverage: someStrawBerryMilk, amount: 20)
            newMachine.addStock(beverage: someBananaMilk, amount: 30)
            newMachine.addStock(beverage: someCola, amount: 40)
            newMachine.addStock(beverage: someAmericano, amount: 50)
            newMachine.addStock(beverage: someAmericano2, amount: 60)
            
            return newMachine
        }
    }
    
    static func saveData(_ machine: Machine) {
        do {
            let encodedData = try NSKeyedArchiver.archivedData(withRootObject: machine, requiringSecureCoding: false)
            UserDefaults.standard.set(encodedData, forKey: machineKey)
        } catch {
            print(error.localizedDescription)
        }
    }
}
