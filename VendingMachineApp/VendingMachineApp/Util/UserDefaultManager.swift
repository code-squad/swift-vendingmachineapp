//
//  UserDefaultManager.swift
//  VendingMachineApp
//
//  Created by CHOMINJI on 21/10/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import Foundation

struct UserDefaultManager<T> {
    let key: String
    
    func load() -> T? {
        guard let encodedData = UserDefaults.standard.data(forKey: key),
            let loaded = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(encodedData) as? T else {
                return nil
        }
        return loaded
    }
    
    func save() {
        let encodedData = try? NSKeyedArchiver.archivedData(withRootObject: VendingMachine.sharedInstance, requiringSecureCoding: false)
        
        UserDefaults.standard.set(encodedData, forKey: key)
    }
    
}
