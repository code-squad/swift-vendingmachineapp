//
//  SceneDelegate.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate

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
        guard let vm = appDelegate.vendingMachine else {
            return
        }
        let data = ArchivingManager.archive(with: vm)
        UserDefaults.standard.set(data, forKey: "vm")
    }
}

