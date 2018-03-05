//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 권재욱 on 2018. 3. 5..
//  Copyright © 2018년 권재욱. All rights reserved.
//

import UIKit

let baseProductsBox = [
    StrawberryMilk(), StrawberryMilk(), StrawberryMilk(),
    BananaMilk(), BananaMilk(), BananaMilk(),
    PepciCoke(), PepciCoke(), PepciCoke(), PepciCoke(), PepciCoke(),
    Fanta(), Fanta(), Fanta(),
    TOPCoffee(), TOPCoffee(), TOPCoffee(),
    Georgia(), Georgia()
]

class ViewController: UIViewController {

    var vendingMachine = VendingMachine(productsBox: baseProductsBox)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

