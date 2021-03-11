//
//  DataCenter.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/03/10.
//

import Foundation
import UIKit

class VendingMachineDataCenter {
    static func load() -> VendingMachine {
        let data = UserDefaults.standard.object(forKey: "vendingMachineApp")
        do {
            let vendingMachine = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data as! Data) as? VendingMachine
            return vendingMachine ?? VendingMachine()
        } catch {
            print(error)
        }
        return VendingMachine()
    }

    static public func save(to vendingMachine: VendingMachine) {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: vendingMachine, requiringSecureCoding: false)
            UserDefaults.standard.set(data, forKey: "vendingMachineApp")
        } catch {
            print(error)
        }
    }
}
