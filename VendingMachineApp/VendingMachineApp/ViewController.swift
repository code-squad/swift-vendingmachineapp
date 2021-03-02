//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/02/26.
//

import UIKit

class ViewController: UIViewController {

    private let bananaMilkFactory = BananaMilkFactory()
    private let cantatacoffeeFactory = CantataCoffeeFactory()
    private let ciderFactory = CiderFactory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vendingMachine = VendingMachine(products: [bananaMilkFactory.produce(), cantatacoffeeFactory.produce(), ciderFactory.produce()])
        OutputView.printBeverages(vendingMachine: vendingMachine)
    }
}

