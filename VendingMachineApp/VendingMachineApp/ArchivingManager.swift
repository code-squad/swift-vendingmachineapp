//
//  ArchivingManager.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/03/11.
//

import Foundation

class ArchivingManager {
    static func unarchive(with text: Data) -> Any? {
        do {
            let object = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(text)
            return object
        }
        catch {
            print(error)
        }
        return nil
    }
    
    static func archive<T>(with things: T) -> Data {
        do {
            let archived = try NSKeyedArchiver.archivedData(withRootObject: things, requiringSecureCoding: false)
            return archived
        }
        catch {
            print(error)
        }
        return Data()
    }
}
