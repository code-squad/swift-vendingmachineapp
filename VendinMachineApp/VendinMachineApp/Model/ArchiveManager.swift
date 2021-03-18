
import Foundation
//if let data = UserDefaults.standard.data(forKey: "vendingMachine3"), let vendingMachineDate = ArchiveManager.unarchive(with: data) {
//    vendingMachine = vendingMachineDate
//}
class ArchiveManager {
    
    static func archive(with things: VendingMachine) {
        do {
            let archived = try NSKeyedArchiver.archivedData(withRootObject: things, requiringSecureCoding: false)
            UserDefaults.standard.set(archived, forKey: "vendingMachine")
        }
        catch {
            print(error)
        }
    }
    
    static func unarchiveVendingMachine() -> VendingMachine? {
        if let data = UserDefaults.standard.data(forKey: "vendingMachine") {
            do {
                let object = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data)
                return object as? VendingMachine
            }
            catch { }
        }
        return VendingMachine()
    }
}
