//
//  ArchivingManager.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/03/12.
//

import Foundation

class ArchivingManager {
    static func archive(with things: [Beverage]) -> Data {
        do {
            let archived = try NSKeyedArchiver.archivedData(withRootObject: things, requiringSecureCoding: false)
            return archived
        }
        catch {
            print(error)
        }
        return Data()
    }

    static func unarchive(with text: Data) -> [Beverage]? {
        do {
            let object = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(text)
            return object as? [Beverage]
        }
        catch {
            print(error)
        }
        return []
    }
}
