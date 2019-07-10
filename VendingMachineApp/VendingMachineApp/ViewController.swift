//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 김지나 on 21/06/2019.
//  Copyright © 2019 김지나. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var vending = VendingMachine()
    var inven = Inventory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var beverage = [BeverageType.chocolate,BeverageType.cola]
        var list = inven.beverageList(beverage)
        print(vending.drinks(list))
    }


}

