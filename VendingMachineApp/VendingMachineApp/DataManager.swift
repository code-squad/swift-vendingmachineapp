//
//  DataManager.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/03/18.
//

import Foundation

class DataManager {
    static let userDefault = UserDefaults.standard
    
    static func load(forKey: String) -> Any {
        return userDefault.object(forKey: forKey) as Any
    }
    
    static func save<T>(data: T, forKey: String) {
        userDefault.set(data, forKey: forKey)
    }
}
