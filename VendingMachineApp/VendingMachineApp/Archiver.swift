//
//  Archiver.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/03/12.
//

import Foundation

class Archiver {
    static func archive(with things: Any) -> Data? {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: things, requiringSecureCoding: false)
            return data
        } catch {
            return nil
        }
    }
    
    static func unarchive(with things: Data) -> Any? {
        do {
            let object = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(things)
            return object
        } catch {
            return nil
        }
    }
}
