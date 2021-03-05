//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/02/22.
//

import UIKit

class ViewController: UIViewController {
    private var vendingMachine: VendingMachine
    
    required init?(coder: NSCoder) {
        self.vendingMachine = VendingMachine()
        
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


}

