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
        appDelegate.save()
    }
}
