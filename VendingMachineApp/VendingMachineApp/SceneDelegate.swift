//
//  SceneDelegate.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    
    func sceneWillResignActive(_ scene: UIScene) {
        guard let data = Archiver.archive(with: VendingMachine.shared) else { return }
        UserDefaults.standard.setValue(data, forKey: "vendingMachine")
        
    }
}

