//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var vendingMachine: VendingMachine!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        loadAll()
        return true
    }
    
    enum Keys {
        static let vendingMachine = "vendingMachine"
    }

    private func loadAll() {
        if let vendingMachineData = UserDefaults.standard.data(forKey: Keys.vendingMachine),
           let vendingMachine = unarchive(with: vendingMachineData) as? VendingMachine {
            self.vendingMachine = vendingMachine
        } else {
            self.vendingMachine = VendingMachine(storage: BeverageStorage(),
                                                 dispensedList: DispensedList(),
                                                 moneyBox: MoneyBox(),
                                                 beverageManager: BeverageManager(temperatureStandard: 36.5,
                                                                                  sugarStandard: 1.0,
                                                                                  lactoStandard: 3.5))
        }
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
    
    func archive(with things: Any) -> Data {
        do {
            let archived = try NSKeyedArchiver.archivedData(withRootObject: things, requiringSecureCoding: false)
            return archived
        } catch {
            print(error)
        }
        return Data()
    }
}
