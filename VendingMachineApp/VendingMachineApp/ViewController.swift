//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var moneyLabel: UILabel!
    
    private let images = [UIImage(named: "bananaMilk"), UIImage(named: "top"), UIImage(named: "cokaCola")]
    private let types: [BeverageFactory.Type] = [MilkFactory.self, CoffeeFactory.self, SodaFactory.self]
    private var updateModelHelper: [UIButton: BeverageFactory.Type] = [:]
    private var updateLabelHelper: [UIButton: UILabel] = [:]
    private var vendingMachine = VendingMachine()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addMoney5000(_ sender: Any) {
        vendingMachine.put(in: .fiveThousand)
        moneyLabel.text = "잔액: \(vendingMachine.showCurrentMoney()) 원"
    }
    
    @IBAction func addMoney1000(_ sender: Any) {
        vendingMachine.put(in: .thousand)
        moneyLabel.text = "잔액: \(vendingMachine.showCurrentMoney()) 원"
    }
}
