//
//  DataCenter.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/03/10.
//

import Foundation
import UIKit

class DataCenter {
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

    static public func save() {
        do {
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let vendingMachine = appDelegate.vendingMachine ?? VendingMachine()
            let data = try NSKeyedArchiver.archivedData(withRootObject: vendingMachine, requiringSecureCoding: false)
            UserDefaults.standard.set(data, forKey: "vendingMachineApp")
        } catch {
            print(error)
        }
    }
}

//MARK: 파일에 접근해서 load, save
/*
class DataCenter {
    static private var filePath: URL = {
        let stockDataFileName = "StockData"
        let fileManager = FileManager.default
        guard let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return URL(fileURLWithPath: "")}
        return documentDirectory.appendingPathComponent(stockDataFileName)
    }()
    
    static func load() -> VendingMachine {
        if FileManager.default.fileExists(atPath: filePath.path) {
            guard let data = FileManager.default.contents(atPath: filePath.path) else { return VendingMachine() }
            do {
                guard let vendingMachine = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? VendingMachine else { return VendingMachine() }
                return vendingMachine
            } catch {
                print(error)
            }
        }
        let vendingMachine = UserDefaults.standard.object(forKey: "vendingMachineApp") as? VendingMachine
    }
    
    static public func save() {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: vendingMachine, requiringSecureCoding: false)
            try data.write(to: filePath)
        } catch {
            print(error)
        }
    }
}
*/
