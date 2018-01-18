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
    var machine: VendingMachine
    let encoder: PropertyListEncoder
    let decoder: PropertyListDecoder
    init() {
        self.machine = VendingMachine()
        self.encoder = PropertyListEncoder()
        self.decoder = PropertyListDecoder()
    }

    func saveChanges() {
        var data = Data()
        do {
            data = try encoder.encode(self.machine)
        } catch {
            NSLog(error.localizedDescription)
        }
        UserDefaults.standard.set(data, forKey: MachineStore.Key)
    }

    func loadMachine() {
        guard let data = UserDefaults.standard.data(forKey: MachineStore.Key) else { return }
        do {
            machine = try decoder.decode(VendingMachine.self, from: data)
        } catch {
            NSLog(error.localizedDescription)
        }
    }
}
