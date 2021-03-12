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
        
        beverageManager = BeverageManager(dateStandard: Date(),
                                          temperatureStandard: 36.5,
                                          sugarStandard: 1.0,
                                          lactoStandard: 0.5)
        
        loadAll()
        return true
    }
    
    enum Keys {
        static let storage = "storage"
        static let dispensedList = "dispensedList"
        static let moneyBox = "moneyBox"
    }

    private func loadAll() {
        if let storageInTextLoaded = UserDefaults.standard.data(forKey: Keys.storage),
           let dispensedListInTextLoaded = UserDefaults.standard.data(forKey: Keys.dispensedList),
           let moneyBoxInTextLoaded = UserDefaults.standard.data(forKey: Keys.moneyBox),
           let storage = unarchive(with: storageInTextLoaded) as? Storage,
           let dispensedList = unarchive(with: dispensedListInTextLoaded) as? OrderableList,
           let moneyBox = unarchive(with: moneyBoxInTextLoaded) as? MoneyManagable {
            self.storage = storage
            self.dispensedList = dispensedList
            self.moneyBox = moneyBox
        } else {
            self.storage = BeverageStorage()
            self.dispensedList = DispensedList()
            self.moneyBox = MoneyBox()
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
