//
//  MachineDataManager.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/03/13.
//

import Foundation

class MachineDataManager {
    private static let machineKey = "machineKey"
    
    static func loadData() -> Machine? {
        do {
            guard let data = UserDefaults.standard.data(forKey: machineKey) else {print("sdf"); return nil }
            let machineData = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data)
            guard let tempMachine = machineData as? Machine else {print("mem"); return Machine() }
            return tempMachine
        } catch {
            print("error loading machine data")
            print(error.localizedDescription)
        }
        return Machine()
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
