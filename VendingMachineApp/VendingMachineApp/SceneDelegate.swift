//
//  SceneDelegate.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/24.
//

import UIKit

protocol RootViewControllerProtocol {
    var vendingMachine: VendingMachine! { get }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var vendingMachine: VendingMachine!
    
    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let initialViewController = window?.rootViewController as? ViewController else { return }
       
        self.vendingMachine = ArchivingManager.loadData(forKey: "vendingMachine")
        
        initialViewController.vendingMachine = vendingMachine
    }

    func sceneDidDisconnect(_ scene: UIScene) {
       
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
 
    }

    func sceneWillResignActive(_ scene: UIScene) {
        ArchivingManager.save(data: vendingMachine, forkey: "vendingMachine")
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // 앱 켰을 때 초기 잔액 LabelText 변경
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "addMoney"), object: vendingMachine, userInfo: nil)
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }
}

