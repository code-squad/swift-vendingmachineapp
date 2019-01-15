//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 윤동민 on 15/01/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var machine: VendingMachine = VendingMachine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        OutputView.printStock(of: machine)
    }


}

