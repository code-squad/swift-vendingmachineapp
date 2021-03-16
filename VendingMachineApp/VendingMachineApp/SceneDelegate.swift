//
//  SceneDelegate.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/02/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private var appDelegate = UIApplication.shared.delegate as! AppDelegate
    private lazy var vendingMachine = appDelegate.vendingMachine
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        let data = Archive.archive(with: vendingMachine)
        UserDefaults.standard.set(data, forKey: "vendingMachine")
    }
}

