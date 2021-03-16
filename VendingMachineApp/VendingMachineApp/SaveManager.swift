//
//  SaveManager.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/03/15.
//

import Foundation

class SaveManager {
    func savevendingMachineData(vendingMachine : VendingMachine){
        var savaData : Data!
        do{
            savaData = try NSKeyedArchiver.archivedData(withRootObject: vendingMachine, requiringSecureCoding: false)
        }catch{
            print(error.localizedDescription)
            return
        }
        UserDefaults.standard.set(savaData, forKey: "vendingMachine")
    }
    
    func loadvendingMachineData() -> VendingMachine?{
        var tempVendingMachine : VendingMachine? = nil
        if let savedVendingMachine = UserDefaults.standard.object(forKey: "vendingMachine") as? Data{
            if let decodedVendingMachine = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(savedVendingMachine) as? VendingMachine {
                tempVendingMachine = decodedVendingMachine
            }
        }
        return tempVendingMachine
    }
}
