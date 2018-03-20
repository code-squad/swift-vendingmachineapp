//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by YOUTH on 2018. 3. 20..
//  Copyright © 2018년 JINiOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let coffee = Coffee(brand: "맥심", weight: 350, price: 2000, name: "TOP", manufactured: "20180101")
        let energyDrink = EnergyDrink(brand: "레드불", weight: 300, price: 3000, name: "레드불", manufactured: "20180201")
        let chocoMilk = ChocoMilk(brand: "서울우유", weight: 200, price: 900, name: "초코유유", manufactured: "20180319")

        let vendingMachine = VendingMachine(stockItems: [coffee, energyDrink, chocoMilk])
        print(vendingMachine.showStockDefault())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

