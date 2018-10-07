//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by oingbong on 04/10/2018.
//  Copyright © 2018 oingbong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func addStrawBerryMilkBtn(_ sender: UIButton) {
    }
    @IBAction func addChocolateMilkBtn(_ sender: UIButton) {
    }
    @IBAction func addBananaMilkBtn(_ sender: UIButton) {
    }
    @IBAction func addCokeBtn(_ sender: UIButton) {
    }
    @IBAction func addCiderBtn(_ sender: UIButton) {
    }
    @IBAction func addFantaBtn(_ sender: UIButton) {
    }
    @IBAction func addTopCoffeeBtn(_ sender: UIButton) {
    }
    @IBAction func addCantataCoffeeBtn(_ sender: UIButton) {
    }
    @IBAction func addGeorgiaCoffeeBtn(_ sender: UIButton) {
    }
    
    @IBOutlet var beverageStock: [UILabel]!
    @IBOutlet var beverageImages: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let vendingMachine = VendingMachine(with: Stock.prepareStock())
        if let stockList = vendingMachine.stockList() {
            for index in 0..<stockList.count {
                beverageStock[index].text = "\(stockList[index].count)개"
            }
        }
        
    }

}
