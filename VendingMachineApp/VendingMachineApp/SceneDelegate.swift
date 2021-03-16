//
//  SceneDelegate.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/02/26.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var vendingMachine = VendingMachine(moneyManager: Money(), inventoryManager: Inventory(), purchaseHistoryManager: PurchaseHistory())

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let _ = (scene as? UIWindowScene) else { return }
        if let savedData = VendingMachineDataManager.load() {
            guard let initialViewController = window?.rootViewController as? Stateful else { return }
            initialViewController.vendingMachine = savedData
        } else {
            if let initialViewController = window?.rootViewController as? Stateful {
                initialViewController.vendingMachine = vendingMachine
            }
        }

//        if let initialViewController = window?.rootViewController as? Stateful {
//            initialViewController.vendingMachine = vendingMachine
//        }
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        VendingMachineDataManager.save(vendingMachine)
    }
}

