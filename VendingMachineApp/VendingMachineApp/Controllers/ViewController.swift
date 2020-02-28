//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Cory Kim on 2020/02/20.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var vendingMachine = VendingMachine(products: [])

    @IBOutlet var productsStackView: [UIStackView]!
    @IBOutlet var addToStockButtons: [UIButton]!
    @IBOutlet var beverageImageViews: [UIImageView]!
    
    @IBAction func addToStockButtonTouched(_ sender: Any) {
        let button = sender as! UIButton
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        beverageImageViews.forEach {
            $0.layer.cornerRadius = 16
        }
    }
}

