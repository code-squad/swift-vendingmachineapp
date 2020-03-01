//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/20.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var vendingMachine = VendingMachine()
    @IBOutlet var addToStockButtons: [UIButton]!
    @IBOutlet var beverageImageViews: [UIImageView]!
    @IBOutlet var berverageStockLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNotification()
    }

    @IBAction func addToStockButtonTouched(_ sender: Any) {
        let button = sender as! UIButton
        vendingMachine.addToStock(index: button.tag)
    }
    
    private func setupNotification() { NotificationCenter.default.addObserver(self, selector: #selector(updateLabel(_:)), name: NSNotification.Name(rawValue: "AddToStockButton"), object: nil)
    }
    
    @objc private func updateLabel(_ notification: Notification) {
        guard let changedIndex = notification.userInfo?["changedIndex"] as? Int, let changedBeverageStockNumber = notification.userInfo?["numberOfBeverage"] as? Int else { return }
        
        berverageStockLabels.forEach {
            guard $0.tag == changedIndex else { return }
            $0.text = String(changedBeverageStockNumber)
        }
    }
    
    private func setupUI() {
        beverageImageViews.forEach {
            $0.layer.cornerRadius = 16
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: Notification.Name(rawValue: "AddToStockButton"), object: nil)
    }
}

