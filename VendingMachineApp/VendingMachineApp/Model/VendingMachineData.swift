import Foundation

class VendingMachineData {
    
    private let vendingMachineKey = "vendingMachineKey"
    
    func loadData() -> VendingMachine? {
        guard let data = UserDefaults.standard.data(forKey: vendingMachineKey) else { return nil }
        let vendingMachineData = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data)
        guard let vendingMachine = vendingMachineData as? VendingMachine else { return nil }
        return vendingMachine
    }
    
    func saveData(_ vendingMachine: VendingMachine) {
        do {
            let encodedData = try NSKeyedArchiver.archivedData(withRootObject: vendingMachine, requiringSecureCoding: false)
            UserDefaults.standard.set(encodedData, forKey: vendingMachineKey)
        }
        catch {
            print(error)
        }
    }
}
