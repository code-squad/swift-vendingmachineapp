//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 김수현 on 2018. 6. 28..
//  Copyright © 2018년 김수현. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var vendingmachine: Vendingmachine
    
    let beverages = BeverageFactory().setBeverage()
    
    required init?(coder aDecoder: NSCoder) {
        vendingmachine = Vendingmachine(beverages)
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        showInventory()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func showInventory() {
        print("=> ", terminator: "")
        let kind = vendingmachine.makeKindOfBeverage()
        for item in kind {
            let beverage = vendingmachine[item]
            if let kind = beverage?.map({$0.kind}) {
                print("\(kind.first ?? "")(\(kind.count)개) ", terminator: "")
            }
        }
    }

}

