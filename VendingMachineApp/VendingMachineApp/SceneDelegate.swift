//
//  SceneDelegate.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        VendingMachineDataManager.save(self.appDelegate.vendingMachine)
    }
}

