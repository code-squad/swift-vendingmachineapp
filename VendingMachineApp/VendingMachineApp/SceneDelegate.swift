//
//  SceneDelegate.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    lazy private var vendingMachine = appDelegate.vendingMachine!
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        appDelegate.saveVendingMachineData(vendingMachine)
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        appDelegate.saveVendingMachineData(vendingMachine)
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        appDelegate.saveVendingMachineData(vendingMachine)
    }
}

