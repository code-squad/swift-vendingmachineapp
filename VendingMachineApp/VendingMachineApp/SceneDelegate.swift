//
//  SceneDelegate.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/02/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func sceneWillResignActive(_ scene: UIScene) {
        ArchiveManager.archive(data: (UIApplication.shared.delegate as! AppDelegate).vendingMachine!)
    }
}

