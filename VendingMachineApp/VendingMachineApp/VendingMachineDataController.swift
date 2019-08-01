//
//  VendingMachineDataController.swift
//  VendingMachineApp
//
//  Created by hw on 01/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation

class VendingMachineDataController {
    private var vendingMachine: VendingMachine!
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    static let shared = VendingMachineDataController()
    
    init(){
        guard fetchData() == nil else { return }
        vendingMachine = VendingMachine.sharedInstance
        encode()
    }

    func encode(){
        encoder.outputFormatting = [.sortedKeys, .prettyPrinted]
        guard let jsonData = try? encoder.encode(vendingMachine)else{
            return
        }
        UserDefaults.standard.set(jsonData, forKey: "vendingMachine")
    }
    
    private func flushPreviousVendingMachineData(){
        UserDefaults.standard.set(nil, forKey: "vendingMachine")
    }
    
    private func decodeJsonData(_ jsonData: Data)-> VendingMachine? {
        guard let machine = try? decoder.decode(VendingMachine.self, from: jsonData) else{
            return nil
        }
        return machine
    }
    
    func fetchData() -> VendingMachine? {
        if vendingMachine != nil {
            return vendingMachine
        }
        guard let jsonData = loadData() else{
            return nil
        }
        guard let machine = decodeJsonData(jsonData) else{
            return nil
        }
        vendingMachine = machine
        return vendingMachine
    }
    
    private func loadData() -> Data? {
        guard let jsonData = UserDefaults.standard.value(forKey: "vendingMachine") as? Data else{
            return nil
        }
        return jsonData
    }
}
