//
//  AdminViewController.swift
//  VendingMachineApp
//
//  Created by Elena on 01/07/2019.
//  Copyright © 2019 elena. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController {
    // MARK: - private variable
    private var vendingMachine: Manager?
    
    // MARK: - @IBOutlet
    @IBOutlet var beverageImageView: [RoundImageView]!
    @IBOutlet var beverageLabel: [UILabel]!
    
    // MARK: - private
    private func showQuantity(index: Int) {
        let count = vendingMachine?.count(beverage: index)
        beverageLabel[index].text = "\(count ?? 0)개"
    }
    
    // MARK: - func
    func set(vendingMachine: Manager?) {
        self.vendingMachine = vendingMachine
    }
    
    // MARK: - @IBAction
    @IBAction func addBeverage(_ sender: UIButton) {
        let beverage = sender.tag
        guard vendingMachine?.add(beverage: beverage) ?? false else { return }
    }
    
    @IBAction func closeButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(objcShowQuantity(_:)), name: .addBeverage, object: nil)
        
        for index in beverageLabel.indices {
            showQuantity(index: index)
        }
    }
    
    // MARK: - @objc
    @objc private func objcShowQuantity(_ notification: Notification) {
        if let data = notification.userInfo?[Notification.NotiKey.purchaseIndex] as? Int {
            showQuantity(index: data)
            return
        }
        for data in beverageLabel.indices {
            showQuantity(index: data)
        }
    }
}
