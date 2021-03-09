//
//  Archive.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/03/08.
//

import Foundation

struct ObjectArchive {
    static func save(with things: VendingMachine) -> Data {
//        guard let archived = try? NSKeyedArchiver.archivedData(withRootObject: things, requiringSecureCoding: false) else { return Data() }
//        return archived
        do {
            let archived = try NSKeyedArchiver.archivedData(withRootObject: things, requiringSecureCoding: false)
            return archived
        }
        catch {
            print(error)
        }
        return Data()
    }

    static func load(with text: Data) -> VendingMachine? {
        guard let object = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(text)
         else { return nil }
        return object as? VendingMachine
    }
}
