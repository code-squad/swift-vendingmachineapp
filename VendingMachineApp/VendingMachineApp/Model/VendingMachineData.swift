import Foundation

class VendingMachineData {
    
    private let key = "encodedData"
    
    func loadedData() -> VendingMachine? {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return nil
        }
        
        guard let vendingMachine = try? PropertyListDecoder().decode(VendingMachine.self, from: data) else {
            return nil
        }
        return vendingMachine
    }
    
    func savedData(_ vendingMachine: VendingMachine) {
        let encodedData = try? PropertyListEncoder().encode(vendingMachine)
        UserDefaults.standard.setValue(encodedData, forKey: key)
    }
}
