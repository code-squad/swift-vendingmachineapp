//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by kimdo2297 on 2020/03/04.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet var beverageNumberLabels: [UILabel]!
    
    @IBAction func plusBeverageButtonTapped(_ sender: PlusBalanceButton) {
        
    }
    
    private var vendingMachine = VendingMachine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
