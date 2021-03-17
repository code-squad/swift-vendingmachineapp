//
//  SceneDelegate.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var vendingMachine: VendingMachine?
    let defaults = UserDefaults.standard
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        guard let vendingMachine = vendingMachine else { return }
        SaveVendingMachineUseCase(for: vendingMachine).start()
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        let loadVendingMachineUseCase = LoadVendingMachineUseCase(for: vendingMachine)
        loadVendingMachineUseCase.start()
        vendingMachine = loadVendingMachineUseCase.vendingMachine
        let viewController = window?.rootViewController as? ViewController
        viewController?.vendingMachine = vendingMachine
    }
}
