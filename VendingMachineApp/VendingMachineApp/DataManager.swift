//
//  DataManager.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/03/17.
//

import Foundation

class DataManager {

    class func load() -> VendingMachine? {
        let stringData = String(describing : VendingMachine.self)
        if UserDefaults.standard.object(forKey: stringData) != nil {
            guard let encodedData = UserDefaults.standard.data(forKey: stringData) else { return nil }
            
            do {
                guard let archivedMachine = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(encodedData)
                else {
                    return nil
                }
                
                return archivedMachine as? VendingMachine
            } catch {
                return nil
            }
        }
        return nil
    }

    class func save(data: VendingMachine) -> Bool {
        let stringData = String(describing : VendingMachine.self)
        
        do {
            UserDefaults.standard.setValue(try NSKeyedArchiver.archivedData(withRootObject: data, requiringSecureCoding: false), forKey: stringData)
        }
        catch {
            return false
        }
        return true
    }
}
