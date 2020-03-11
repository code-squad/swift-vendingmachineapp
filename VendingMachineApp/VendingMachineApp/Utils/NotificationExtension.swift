//
//  NotificationExtension.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/03/11.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

extension NotificationCenter {
    func addObserver(forName name: NSNotification.Name?,
                     using block: @escaping (Any?) -> Void) -> NSObjectProtocol {
        return addObserver(forName: name, object: nil, queue: .main) { block($0.object) }
    }
}

extension Notification.Name {
    static let balanceDidChange = Notification.Name("balanceDidChange")
    static let inventoryDidChange = Notification.Name("inventoryDidChange")
}
