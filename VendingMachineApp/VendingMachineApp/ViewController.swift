//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 22..
//  Copyright © 2018년 moon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var addStockButtons: [UIButton]!
    @IBOutlet var stockImageViews: [UIImageView]!
    var vendingMachine: VendingMachine!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beverageSetup()
        setupStockImageViews()
    }
    
    func beverageSetup() {
        vendingMachine.addBeverage(StrawberryMilk.self, 2)
        vendingMachine.addBeverage(BananaMilk.self)
        vendingMachine.addBeverage(Coke.self, 3)
    }
    
    func setupStockImageViews() {
        for index in self.stockImageViews.indices {
            let imageName = String(format: "imgsource/%d.png", index)
            self.stockImageViews[index].image = UIImage(named: imageName)
        }
        
        self.stockImageViews.forEach{
            $0.backgroundColor = UIColor.white
            $0.layer.borderWidth = 1.0
            $0.layer.borderColor = UIColor.black.cgColor
            $0.contentMode = UIViewContentMode.scaleAspectFit
            $0.layer.cornerRadius = 20
            $0.layer.masksToBounds = true
        }
    }
}
