
import Foundation

class ArchiveManager {
    
    static func archive(with things: VendingMachine) -> Data {
        do {
            let archived = try NSKeyedArchiver.archivedData(withRootObject: things, requiringSecureCoding: false)
            return archived
        }
        catch {
            print(error)
            return Data()
        }
    }
    
    static func unarchive(with things: Data) -> VendingMachine? {
        do {
            let object = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(things)
            return object as? VendingMachine
        }
        catch {
            print(error)
            return nil
        }
    }
}
