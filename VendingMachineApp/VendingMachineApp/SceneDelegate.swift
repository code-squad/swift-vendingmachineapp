//
//  SceneDelegate.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate, AppDelegateAccessible {
    var window: UIWindow?
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        SaveVendingMachineUseCase(for: appDelegate.vendingMachine).start()
    }
}
