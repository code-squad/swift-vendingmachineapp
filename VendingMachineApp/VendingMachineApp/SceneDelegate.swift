//
//  SceneDelegate.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let delegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func sceneWillResignActive(_ scene: UIScene) {
        let vendingMachine = delegate.vendingMachine
        
        DataManager.save(data: vendingMachine)
    }

}

