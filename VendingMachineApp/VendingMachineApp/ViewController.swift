//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Elena on 07/05/2019.
//  Copyright © 2019 elena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var vendingMachine: VendingMachine
    
    // 'required' initializer 'init(coder:)' must be provided by subclass of 'UIViewController'
    
    required init?(coder: NSCoder) {
        self.vendingMachine = VendingMachine(list: Inventory(list: [ObjectIdentifier: Packages]()))
        super.init(coder: coder)
    }
    
    private func showBeverageList() {
        let beverages = [Sprite(), Sprite(), Sprite(), CocaCola(),
                         CocaCola(), CocaCola(),CocaCola(),
                         ChocolateMilk(), ChocolateMilk(),
                         BananaMilk(), BananaMilk(),
                         CantataCoffee(), CantataCoffee(), CantataCoffee(),
                         StarbucksCoffee(), StarbucksCoffee()]
        
        beverages.forEach { beverage in vendingMachine.add(beverage: beverage) }
        
        let form = { (name: String, goods: Int, mark: Bool)
            in
            print("\(mark ? "✅" : "🚫") \(name)(\(goods)개)")
        }
        vendingMachine.showListOfAll(list: form)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        showBeverageList()
    }


}
