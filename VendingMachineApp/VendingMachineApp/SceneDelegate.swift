//
//  SceneDelegate.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var vendingMachine: VendingMachine!
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        vendingMachine = VendingMachine.default
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        VendingMachineDataCenter.saveVendingMachineData(vendingMachine)
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        VendingMachineDataCenter.saveVendingMachineData(vendingMachine)
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        VendingMachineDataCenter.saveVendingMachineData(vendingMachine)
    }
}

