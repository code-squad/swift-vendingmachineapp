//
//  ArchivingCenter.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/16.
//

import Foundation

class ArchivingCenter {
    
    enum Keys {
        static let vendingMachine = "vendingMachine"
    }
    
    func loadVendingMachine() -> VendingMachine {

        var machineLoaded: VendingMachine
        
        if let vendingMachineData = UserDefaults.standard.data(forKey: Keys.vendingMachine),
           let vendingMachine = unarchive(with: vendingMachineData) as? VendingMachine {
            machineLoaded = vendingMachine
        } else {
            let newBeverageManager = BeverageManager(temperatureStandard: Settings.Standards.temperature,
                                                     sugarStandard: Settings.Standards.sugar,
                                                     lactoStandard: Settings.Standards.lactose)
            machineLoaded = VendingMachine(storage: BeverageStorage(),
                                                 dispensedList: DispensedList(),
                                                 moneyBox: MoneyBox(),
                                                 beverageManager: newBeverageManager)
        }
        return machineLoaded
    }

    private func unarchive(with text: Data) -> Any? {
        do {
            let object = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(text)
            return object
        } catch {
            print(error)
        }
        return nil
    }
    
    func save(_ vendingMachine: VendingMachine) {
        let vendingMachineData = archive(with: vendingMachine as Any)
        UserDefaults.standard.setValue(vendingMachineData, forKey: Keys.vendingMachine)
    }
    
    private func archive(with things: Any) -> Data {
        do {
            let archived = try NSKeyedArchiver.archivedData(withRootObject: things, requiringSecureCoding: false)
            return archived
        } catch {
            print(error)
        }
        return Data()
    }
    
}
