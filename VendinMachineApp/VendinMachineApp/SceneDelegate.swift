//
//  SceneDelegate.swift
//  VendinMachineApp
//
//  Created by user on 2021/02/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        let data = appDelegate.archive(with: appDelegate.vendingMachine)
        UserDefaults.standard.set(data, forKey: "vendingMachine3")
    }
}

