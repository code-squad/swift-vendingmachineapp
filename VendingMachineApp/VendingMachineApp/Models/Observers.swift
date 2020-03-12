//
//  Observers.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/03/12.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class Observers {
    private var observers = [NSObjectProtocol]()
    private let center = NotificationCenter.default
    
    func addObserver(forName name: NSNotification.Name?, using block: @escaping (Any?) -> Void) {
        let observer = center.addObserver(forName: name, using: block)
        observers.append(observer)
    }
    
    func removeObservers() {
        observers.forEach { center.removeObserver($0) }
    }
}
