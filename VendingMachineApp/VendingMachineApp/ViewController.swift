//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Chaewan Park on 2020/02/27.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var vendingMachineStackView: UIStackView!
    @IBOutlet weak var productsStackView: UIStackView!
    @IBOutlet weak var controllerStackView: UIStackView!
    
    @IBOutlet var beverageViews: [UIView]!
    
    let vendingMachine = VendingMachine(cashier: Cashier())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutStackViewsToReadableContentGuide()
        layoutBeverageViews()
    }
}

extension ViewController {
    private func layoutStackViewsToReadableContentGuide() {
        let readableGuide = view.readableContentGuide
        productsStackView.leadingAnchor.constraint(equalTo: readableGuide.leadingAnchor).isActive = true
        productsStackView.trailingAnchor.constraint(equalTo: readableGuide.trailingAnchor).isActive = true
        controllerStackView.leadingAnchor.constraint(equalTo: readableGuide.leadingAnchor).isActive = true
        controllerStackView.trailingAnchor.constraint(equalTo: readableGuide.trailingAnchor).isActive = true
    }
    
    private func layoutBeverageViews() {
        beverageViews.forEach {
            $0.layer.cornerRadius = 25;
        }
    }
}
