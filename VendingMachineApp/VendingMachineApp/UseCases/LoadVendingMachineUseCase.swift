//
//  LoadVendingMachineUseCase.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/16.
//

import Foundation

protocol Unarchivable { }

class LoadVendingMachineUseCase: UseCase {
    var vendingMachine: VendingMachine?
    
    init(for vendingMachine: VendingMachine?) {
        self.vendingMachine = vendingMachine
    }
    
    struct PropertyKey {
        static let vendingMachineKey = "vendingMachine"
    }
    
    func start() {
        if let object = UserDefaults.standard.object(forKey: PropertyKey.vendingMachineKey) {
            vendingMachine = unarchive(with: object as! Data) as? VendingMachine
        } else {
            initialSetupVendingMachine()
        }
    }
    
    func unarchive(with object: Data) -> Unarchivable? {
        do {
            let unarchived = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(object)
            return unarchived as? Unarchivable
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
    
    private func initialSetupVendingMachine() {
        let fiveSlotsVendingMachine = VendingMachine(numberOfSlots: 5)
        let beverageFactoryList: [BeverageFactory] = [DenmarkStrawberryMilkFactory(), MaeilChocolateMilkFactory(), ZeroSugarCokeFactory(), GeorgiaMaxFactory(), RedBullFactory()]
        beverageFactoryList.forEach { factory in
            fiveSlotsVendingMachine.bulkInsert(itemFrom: factory, quantity: 5, manufactured: Date().formattedDate(from: "20210222"), expiredAfter: Date().formattedDate(from: "20210302"))
        }
    }
}
