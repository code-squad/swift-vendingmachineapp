//
//  SceneDelegate.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    let vendingMachine = (UIApplication.shared.delegate as! AppDelegate).vendingMachine!
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        VendingMachineDataCenter.save(to: vendingMachine)
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        VendingMachineDataCenter.save(to: vendingMachine)
    }
}

