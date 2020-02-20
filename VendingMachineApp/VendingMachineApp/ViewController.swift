//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/20.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var vendingMachine: VendingMachine?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        vendingMachine = VendingMachine()
    }


}

