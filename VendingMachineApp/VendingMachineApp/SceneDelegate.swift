//
//  SceneDelegate.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/02/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    lazy private var vendingMachine = appDelegate.vendingMachine!
    
    override init() {
        
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        SaveManager().savevendingMachineData(vendingMachine: vendingMachine)
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        SaveManager().savevendingMachineData(vendingMachine: vendingMachine)
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        SaveManager().savevendingMachineData(vendingMachine: vendingMachine)
    }
}
