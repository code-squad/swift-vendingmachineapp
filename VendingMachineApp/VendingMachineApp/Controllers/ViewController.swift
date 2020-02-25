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
    let vendingMachineTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Cory's Vending Machine"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 36)
        return label
    }()
    let productStackView = ProductStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = #colorLiteral(red: 0.9411766529, green: 0.3607842624, blue: 0.2039215267, alpha: 1)
        view.addSubview(vendingMachineTitleLabel)
        vendingMachineTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        vendingMachineTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        vendingMachineTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(productStackView)
        productStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        productStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    }
}

