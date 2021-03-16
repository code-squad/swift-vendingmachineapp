//
//  SceneDelegate.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        archiveVendingMachine()
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        archiveVendingMachine()
    }
    
    func archiveVendingMachine() {
        let data = ArchivingManager.archive(with: VendingMachine.shared)
        UserDefaults.standard.set(data, forKey: "vm")
    }
}

