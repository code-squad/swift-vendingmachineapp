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
    var storage: Storage!
    var dispensedList: OrderableList!
    var moneyBox: MoneyManagable!
    var beverageManager: FoodManagable!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        loadAll()
        return true
    }

    private func loadAll() {
        if let storageInTextLoaded = UserDefaults.standard.data(forKey: "storage"),
           let dispensedListInTextLoaded = UserDefaults.standard.data(forKey: "dispensedList"),
           let moneyBoxInTextLoaded = UserDefaults.standard.data(forKey: "moneyBox"),
           let beverageManagerInTextLoaded = UserDefaults.standard.data(forKey: "beverageManager"),
           let storage = unarchive(with: storageInTextLoaded) as? Storage,
           let dispensedList = unarchive(with: dispensedListInTextLoaded) as? OrderableList,
           let moneyBox = unarchive(with: moneyBoxInTextLoaded) as? MoneyManagable,
           let beverageManager = unarchive(with: beverageManagerInTextLoaded) as? FoodManagable {
            self.storage = storage
            self.dispensedList = dispensedList
            self.moneyBox = moneyBox
            self.beverageManager = beverageManager
        } else {
            self.storage = BeverageStorage()
            self.dispensedList = DispensedList()
            self.moneyBox = MoneyBox()
            self.beverageManager = BeverageManager(dateStandard: Date(),
                                                   temperatureStandard: 36.5,
                                                   sugarStandard: 1.0,
                                                   lactoStandard: 0.5)
        }
        self.vendingMachine = VendingMachine(storage: storage,
                                             dispensedList: dispensedList,
                                             moneyBox: moneyBox,
                                             beverageManager: beverageManager)
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
