//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/02/26.
//

import UIKit

class ViewController: UIViewController {

    private let milkFactory = MilkFactory()
    private let coffeeFactory = CoffeeFactory()
    private let softDrinkFactory = SoftDrinkFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vendingMachine = VendingMachine(products: [milkFactory.produce(), coffeeFactory.produce(), softDrinkFactory.produce()])
        OutputView.printBeverages(vendingMachine: vendingMachine)
    }
}

