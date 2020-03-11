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
    
    @IBOutlet weak var balanceLabel: UILabel!
    
    @IBOutlet var beverageViews: [UIView]!
    @IBOutlet var beverageLabels: [UILabel]!
    @IBOutlet var addBeverageButtons: [UIButton]!
    
    private let vendingMachine = VendingMachine(cashier: Cashier())
    
    private var observers = [NSObjectProtocol]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layoutStackViews()
        layoutBeverageViews()
        
        addViewUpdatingObservers()
    }
    
    private func addViewUpdatingObservers() {
        let center = NotificationCenter.default
        
        let observer = center.addObserver(forName: .balanceDidChange, userInfoKey: .balance) { [weak self] in
            guard let balance = $0 as? Int else { return }
            self?.balanceLabel.text = "\(balance)"
        }
        
        observers.append(observer)
    }
    
    deinit {
        observers.forEach { NotificationCenter.default.removeObserver($0) }
    }
    
    @IBAction func insertMoney(_ sender: UIButton) {
        vendingMachine.insert(money: 1000)
    }
}

extension ViewController {
    private func layoutStackViews() {
        let readableGuide = view.readableContentGuide
        productsStackView.leadingAnchor.constraint(equalTo: readableGuide.leadingAnchor).isActive = true
        productsStackView.trailingAnchor.constraint(equalTo: readableGuide.trailingAnchor).isActive = true
        controllerStackView.leadingAnchor.constraint(equalTo: readableGuide.leadingAnchor).isActive = true
        controllerStackView.trailingAnchor.constraint(equalTo: readableGuide.trailingAnchor).isActive = true
    }
    
    private func layoutBeverageViews() {
        beverageViews.forEach {
            $0.layer.cornerRadius = 30;
        }
    }
}
