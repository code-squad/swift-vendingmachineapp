//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Cloud on 2020/03/10.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var manager: DataManager = DataManager()
    var vendingMachineView: VendingMachineView {
        view as! VendingMachineView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vendingMachineView.datasource = manager
        addNotificationObserver()
    }
    
    private func addNotificationObserver() {
        NotificationCenter
            .default
            .addObserver(
                self,
                selector: #selector(pushInformationToView),
                name: .vendingMachine,
                object: nil
        )
    }
    
    @objc private func pushInformationToView(notification: Notification) {
        if let balance = notification.userInfo?["balance"] {
            self.vendingMachineView.update(balance: "잔액: \(balance)")
        } else {
            let valueTuple = notification.userInfo?["beverageCounts"] as? (tag: Int, counts: Int)
            self.vendingMachineView.update(tag: valueTuple?.tag ?? 0, counts: String(valueTuple?.counts ?? 0))
        }
    }
}
