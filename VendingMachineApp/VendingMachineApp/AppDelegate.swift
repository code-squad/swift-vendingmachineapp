//
//  AppDelegate.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import UIKit

protocol AppDelegateAccessible {
    var appDelegate: AppDelegate { get }
}

extension AppDelegateAccessible {
    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var vendingMachine: VendingMachine!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let loadVendingMachineUseCase = LoadVendingMachineUseCase(for: vendingMachine)
        loadVendingMachineUseCase.start()
        vendingMachine = loadVendingMachineUseCase.vendingMachine
        return true
    }
}
