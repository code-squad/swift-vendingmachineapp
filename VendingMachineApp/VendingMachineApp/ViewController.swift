//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/02/22.
//

import UIKit

class ViewController: UIViewController {
    private var vendingMachine: VendingMachine
    @IBOutlet weak var currentMoney: UILabel!
    
    required init?(coder: NSCoder) {
        self.vendingMachine = VendingMachine()
        
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func moneyButtonTouched(_ sender: UIButton) {
        let amount = Int(sender.currentTitle ?? "0")!
        vendingMachine.collectMoney(with: Money(rawValue: amount)!)
        currentMoney.text = "\(vendingMachine.checkBalance())원"
        
    }
    
}

