//
//  SceneDelegate.swift
//  VendingMachineApp
//
//  Created by 양준혁 on 2021/02/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var vendingMachine = (UIApplication.shared.delegate as! AppDelegate).vendingMachine

    func sceneWillResignActive(_ scene: UIScene) {
        let data = Archiver.archive(with: vendingMachine)
        UserDefaults.standard.setValue(data, forKey: "vendingMachine")
    }
}

