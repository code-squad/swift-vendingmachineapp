//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by delma on 27/02/2020.
//  Copyright © 2020 delma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let vendingMachine = VendingMachine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vendingMachine.showBeverages()
    }


}

