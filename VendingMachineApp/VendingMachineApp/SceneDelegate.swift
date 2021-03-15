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

    func sceneDidEnterBackground(_ scene: UIScene) {
        print("ho")
        do {
            let archivedData = try NSKeyedArchiver.archivedData(withRootObject: vendingMachine, requiringSecureCoding: false)
            UserDefaults.standard.setValue(archivedData, forKey: "vendingMachine")
            print("데이터가 아카이빙되어서 저장됨")
        } catch {
            print(error)
        }
    }
}

