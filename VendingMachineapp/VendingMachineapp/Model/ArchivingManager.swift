//
//  ArchivingManager.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/03/12.
//

import Foundation

class ArchivingManager {
    static func archive(with things: VendingMachine) -> Data {
        do {
            let archived = try NSKeyedArchiver.archivedData(withRootObject: things, requiringSecureCoding: false)
            return archived
        }
        catch {
            print(error)
        }
        return Data()
    }

    static func unarchive(with text: Data) -> VendingMachine? {
        do {
            let object = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(text)
            return object as? VendingMachine
        }
        catch {
            print(error)
        }
        return nil
    }
}
