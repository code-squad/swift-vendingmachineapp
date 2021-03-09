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
        let storageIntext = appDelegate.archive(with: appDelegate.storage as Any)
        let dispensedListIntext = appDelegate.archive(with: appDelegate.dispensedList as Any)
        let moneyBoxIntext = appDelegate.archive(with: appDelegate.moneyBox as Any)

        UserDefaults.standard.setValue(storageIntext, forKey: "storage")
        UserDefaults.standard.setValue(dispensedListIntext, forKey: "dispensedList")
        UserDefaults.standard.setValue(moneyBoxIntext, forKey: "moneyBox")
    }
}
