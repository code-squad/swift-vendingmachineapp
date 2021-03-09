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

        if let VMInTextLoaded = UserDefaults.standard.data(forKey: "vendingMachine"),
           let codableVendingMachine = unarchive(with: VMInTextLoaded) {
            self.vendingMachine = codableVendingMachine.vendingMachine
        } else {
            vendingMachine = VendingMachine(dateStandard: Date(),
                                                temperatureStandard: 36.5,
                                                sugarStandard: 1.0,
                                                lactoStandard: 0.5)
        }
        return true
    }
    
    func archive(with things: CodableVendingMachine) -> Data {
        do {
            let archived = try NSKeyedArchiver.archivedData(withRootObject: things, requiringSecureCoding: false)
            return archived
        } catch {
            print(error)
        }
        return Data()
    }

    private func unarchive(with text: Data) -> CodableVendingMachine? {
        do {
            let object = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(text)
            return object as? CodableVendingMachine
        } catch {
            print(error)
        }
        return nil
    }
}
