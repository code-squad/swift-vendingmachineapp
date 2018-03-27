//
//  DataStorage.swift
//  VendingMachineApp
//
//  Created by YOUTH2 on 2018. 3. 27..
//  Copyright © 2018년 JINiOS. All rights reserved.
//

import Foundation

class DataStorage {

    func loadVendingMachine() -> VendingMachine? {
        // 존재확인
        if UserDefaults.standard.object(forKey: "vendingMachine") != nil {
            // key값으로 데이터 가져옴
            let encodedVending = UserDefaults.standard.data(forKey: "vendingMachine")
            guard let archivedMachine = NSKeyedUnarchiver.unarchiveObject(with: encodedVending!) as? VendingMachine else { return nil }
            return archivedMachine
        }
        return nil
    }

    func saveVendingMachine(data: VendingMachine) {
        UserDefaults.standard.set(NSKeyedArchiver.archivedData(withRootObject: data), forKey: "vendingMachine")
    }
}
