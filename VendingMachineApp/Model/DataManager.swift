//
//  DataManager.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/11.
//

import Foundation

class DataManager {
    
    static func load() -> VendingMachine? {
        do {
            let data = UserDefaults.standard.data(forKey: "vendingMachine") 
            let object = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data ?? Data())
            if let machine = object as? VendingMachine {
                return machine
            }
        } catch {
            print(error)
        }
        return VendingMachine()
    }
    static func save(data : VendingMachine){
        do {
            let archived = try NSKeyedArchiver.archivedData(withRootObject: data, requiringSecureCoding: false)
            print("here")
            UserDefaults.standard.set(archived, forKey: "vendingMachine")
        } catch {
            print(error)
        }
    }
}
