//
//  SceneDelegate.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        let vendingMachineData = appDelegate.archive(with: appDelegate.vendingMachine as Any)
        UserDefaults.standard.setValue(vendingMachineData, forKey: AppDelegate.Keys.vendingMachine)
    }
}
