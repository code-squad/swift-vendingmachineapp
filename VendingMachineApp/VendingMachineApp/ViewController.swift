//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by oingbong on 04/10/2018.
//  Copyright © 2018 oingbong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let vendingMachine = VendingMachine(with: Stock.prepareStock())
        if let stockList = vendingMachine.stockList() {
            for stock in stockList {
                print("\(stock[0].beverageName()) (\(stock.count)개)")
            }
        }
    }

}
