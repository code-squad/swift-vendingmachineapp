//
//  SceneDelegate.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/24.
//  Copyright © 2020 신한섭. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let data: Data = UserDefaults.standard.object(forKey: "model") as? Data {
            if let vendingMachine = appDelegate.unarchive(with: data) {
                appDelegate.vendingMachine = vendingMachine
            }
        }
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        let vendingMachine = appDelegate.vendingMachine
        UserDefaults.standard.set(appDelegate.archive(with: vendingMachine), forKey: "model")
    }
    

}

