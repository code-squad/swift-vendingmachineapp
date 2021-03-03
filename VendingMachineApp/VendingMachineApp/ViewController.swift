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
        let list = [StrawberryMilk(), Fanta(), Cantata()]
        self.vendingMachine = VendingMachine(drinks: list)
        
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        vendingMachine.printDrinks()
    }


}

