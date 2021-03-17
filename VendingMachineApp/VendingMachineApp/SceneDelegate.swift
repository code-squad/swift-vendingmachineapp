//
//  SceneDelegate.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/02/26.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate, VendingMachineStateShareable {
    
    var window: UIWindow?
    var vendingMachine: VendingMachine!
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       
        guard let _ = (scene as? UIWindowScene) else { return }
        
        vendingMachine = VendingMachineDataManager.load()
        guard let initialViewController = window?.rootViewController as? VendingMachineStateShareable else { return }
        initialViewController.vendingMachine = vendingMachine
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        VendingMachineDataManager.save(vendingMachine)
    }
}

