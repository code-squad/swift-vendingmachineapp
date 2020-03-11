//
//  NotificationCenterExtension.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/03/11.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

enum UserInfoKeys {
    case balance
}

extension NotificationCenter {
    func addObserver(forName name: NSNotification.Name?,
                     using block: @escaping (Any?) -> Void) -> NSObjectProtocol {
        return addObserver(forName: name, object: nil, queue: .main) {
            block($0.object)
        }
    }
    
    func addObserver(forName name: NSNotification.Name?,
                     userInfoKey: UserInfoKeys,
                     using block: @escaping (Any) -> Void) -> NSObjectProtocol {
        let observer = addObserver(forName: name, object: nil, queue: .main) {
            if let payload = self.descript(notification: $0, key: userInfoKey) {
                block(payload)
            }
        }
        return observer
    }
    
    func descript(notification: Notification, key: UserInfoKeys) -> Any? {
        if let userInfo = notification.userInfo {
            return userInfo[key]
        }
        return nil
    }
}
