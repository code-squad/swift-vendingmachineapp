//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 신한섭 on 2020/02/24.
//  Copyright © 2020 신한섭. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let vendingMachine = VendingMachine()
    @IBOutlet var addStockButtons: [UIButton]!
    @IBOutlet var productImages: [UIImageView]!
    @IBOutlet var stockLabels: [UILabel]!
    @IBOutlet var addBalaceButtons: [UIButton]!
    @IBOutlet weak var balanceLabel: UILabel!
    
    @IBAction func addStock(_ sender: UIButton) {
    }
    
    @IBAction func addBalance(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        makeCornerRadius()
    }
    
    func makeCornerRadius() {
        productImages.forEach{
            $0.layer.cornerRadius = 40
        }
    }
}

