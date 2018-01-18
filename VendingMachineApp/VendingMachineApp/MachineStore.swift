//
//  MachineStore.swift
//  VendingMachineApp
//
//  Created by 심 승민 on 2018. 1. 17..
//  Copyright © 2018년 심 승민. All rights reserved.
//

import Foundation

struct Store {
    private let machine: VendingMachine
    let archiveURL: URL = {
        return ArchiveManager.archiveURL("machine.archive")
    }()

    func saveMachine() -> Bool {
        return NSKeyedArchiver.archiveRootObject(machine, toFile: archiveURL.path)
    }

    func loadMachine() -> VendingMachine? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: archiveURL.path) as? VendingMachine
    }
}
