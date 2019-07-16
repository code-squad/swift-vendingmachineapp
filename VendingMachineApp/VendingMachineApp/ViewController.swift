//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 김성현 on 16/07/2019.
//  Copyright © 2019 김성현. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let formatter = OutputFormatter()
    
    let machine = VendingMachine()
    let maker = BeverageMaker()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        machine.switchMode(to: .administrator)
        try! machine.addItems(maker.exampleBeverages)
        
        let inventoryStr = formatter.inventory(machine.inventory)
        
        print(inventoryStr)
    }


}

