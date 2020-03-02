//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by TTOzzi on 2020/02/21.
//  Copyright © 2020 TTOzzi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var manager = VendingMachineManager()
    private var mainView: MainView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView = view as? MainView
        mainView.vendingMachineManager = manager
        manager.mainViewUpdater = mainView
        manager.updateVendingMachine()
    }
}
