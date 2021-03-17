//
//  SaveVendingMachineUseCase.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/16.
//

import Foundation

protocol UseCase {
    func start()
}

protocol Archivable { }

class SaveVendingMachineUseCase: UseCase {
    private let vendingMachine: VendingMachine
    
    init(vendingMachine: VendingMachine) {
        self.vendingMachine = vendingMachine
    }
    
    func start() {
        let archivedData = archive(with: vendingMachine)
        UserDefaults.standard.set(archivedData, forKey: "vendingMachine")
    }
    
    func archive(with object: Archivable) -> Data {
        do {
            let archived: Data = try NSKeyedArchiver.archivedData(withRootObject: object, requiringSecureCoding: false)
            return archived
        } catch {
            print(error.localizedDescription)
        }
        return Data()
    }
}
