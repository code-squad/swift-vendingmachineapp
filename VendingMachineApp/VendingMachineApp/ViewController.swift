//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 22..
//  Copyright © 2018년 moon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var stockImageViews: [UIImageView]!
    var vendingMachine: VendingMachine!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beverageSetup()
        setupStockImageViewsImage()
    }
    
    func beverageSetup() {
        vendingMachine.addBeverage(StrawberryMilk.self, 2)
        vendingMachine.addBeverage(BananaMilk.self)
        vendingMachine.addBeverage(Coke.self, 3)
    }
    
    func setupStockImageViewsImage() {
        for index in self.stockImageViews.indices {
            let imageName = String(format: "imgsource/%d.png", index)
            self.stockImageViews[index].image = UIImage(named: imageName)
        }
        self.stockImageViews.forEach{ $0.contentMode = UIViewContentMode.scaleAspectFit }
    }
}
