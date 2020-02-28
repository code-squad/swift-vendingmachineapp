//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/21.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var manager = VendingMachineManager()
    var mainView: MainView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView = view as? MainView
        mainView.someDelegate = manager
        manager.anyDelegate = mainView
    }
}
