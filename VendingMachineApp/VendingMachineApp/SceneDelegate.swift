//
//  SceneDelegate.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/24.
//  Copyright © 2020 신한섭. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let data: Data = UserDefaults.standard.value(forKey: "model") as? Data {
            if let vendingMachine = unarchive(with: data) {
                appDelegate.vendingMachine = vendingMachine
            }
        }
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        let vendingMachine = appDelegate.vendingMachine
        UserDefaults.standard.set(archive(with: vendingMachine), forKey: "model")
    }
    
    func archive(with things: VendingMachine) -> Data {
        do {
            let archived = try NSKeyedArchiver.archivedData(withRootObject: things, requiringSecureCoding: false)
            return archived
        }
        catch {
            print(error)
        }
        return Data()
    }
    
    func unarchive(with text: Data) -> VendingMachine? {
        do {
            let object = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(text)
            return object as? VendingMachine
        }
        catch {
            print(error)
        }
        return nil
    }
}

