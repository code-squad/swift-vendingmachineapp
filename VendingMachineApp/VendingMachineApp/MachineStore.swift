//
//  MachineStore.swift
//  VendingMachineApp
//
//  Created by 심 승민 on 2018. 1. 17..
//  Copyright © 2018년 심 승민. All rights reserved.
//

import Foundation

class MachineStore {
    static let Key = "machine"
    let encoder: PropertyListEncoder
    let decoder: PropertyListDecoder
    init() {
        self.encoder = PropertyListEncoder()
        self.decoder = PropertyListDecoder()
    }

    func saveChanges() {
        var data = Data()
        do {
            data = try encoder.encode(VendingMachine.shared())
        } catch {
            NSLog(error.localizedDescription)
        }
        UserDefaults.standard.set(data, forKey: MachineStore.Key)
    }

    func loadData() {
        guard let data = UserDefaults.standard.data(forKey: MachineStore.Key) else { return }
        do {
            let loadedMachine = try decoder.decode(VendingMachine.self, from: data)
            VendingMachine.restoreStates(loadedMachine)
        } catch {
            NSLog(error.localizedDescription)
        }
    }
}
