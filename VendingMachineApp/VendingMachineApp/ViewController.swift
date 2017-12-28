//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Mrlee on 2017. 12. 27..
//  Copyright © 2017년 Napster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ceylonTeaStock: UILabel!
    @IBOutlet weak var spriteStock: UILabel!
    @IBOutlet weak var starBucksStock: UILabel!
    @IBOutlet weak var bananaStock: UILabel!
    @IBOutlet weak var cokeStock: UILabel!
    @IBOutlet weak var ceylonAddButton: UIButton!
    @IBOutlet weak var spriteAddButton: UIButton!
    @IBOutlet weak var starbucksAddButton: UIButton!
    @IBOutlet weak var cokeAddButton: UIButton!
    @IBOutlet weak var bananaAddButton: UIButton!
    private var vendingMachine = VendingMachineData()
    override func viewDidLoad() {
        super.viewDidLoad()
        let boundRatio: CGFloat = 15.0
        ceylonAddButton.layer.cornerRadius = boundRatio
        spriteAddButton.layer.cornerRadius = boundRatio
        starbucksAddButton.layer.cornerRadius = boundRatio
        cokeAddButton.layer.cornerRadius = boundRatio
        bananaAddButton.layer.cornerRadius = boundRatio
    }
    @IBAction func bananaAddTouched(_ sender: Any) {
        let lightBanana = LightBananaMilk(manufacturingDate: Date())
        vendingMachine.addBeverage(lightBanana)
        bananaStock.text = "\(vendingMachine.sortedStockList[lightBanana]!)개"
    }
    @IBAction func cokeAddTouched(_ sender: Any) {
        let coke = Coke(manufacturingDate: Date())
        vendingMachine.addBeverage(coke)
        cokeStock.text = "\(vendingMachine.sortedStockList[coke]!)개"
    }
    @IBAction func starBucksAddTouched(_ sender: Any) {
        let starBucks = StarBucksCoffee(manufacturingDate: Date())
        vendingMachine.addBeverage(starBucks)
        starBucksStock.text = "\(vendingMachine.sortedStockList[starBucks]!)개"
    }
    @IBAction func spriteAddTouched(_ sender: Any) {
        let sprite = Sprite(manufacturingDate: Date())
        vendingMachine.addBeverage(sprite)
        spriteStock.text = "\(vendingMachine.sortedStockList[sprite]!)개"
    }
    @IBAction func ceylonAddTouched(_ sender: Any) {
        let ceylonTea = CeylonTea(manufacturingDate: Date())
        vendingMachine.addBeverage(ceylonTea)
        ceylonTeaStock.text = "\(vendingMachine.sortedStockList[ceylonTea]!)개"
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
