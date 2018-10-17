//
//  AdminViewController.swift
//  VendingMachineApp
//
//  Created by oingbong on 17/10/2018.
//  Copyright © 2018 oingbong. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController {
    @IBOutlet var beverageStock: [UILabel]!
    @IBOutlet var beverageImages: [UIImageView]!
    @IBAction func closeBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func tappedAddStockBtn(_ sender: UIButton) {
        if let selectedBeverage = Product(rawValue: sender.tag) {
            addStock(target: selectedBeverage)
        }
    }
    
    private let adminMode = AdminMode(with: VendingMachine.shared)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createdObservers()
        roundEdgeOfImage()
        refreshStock()
    }
    
    private func createdObservers() {
        // addStock
        let nameUpdateStock = Notification.Name(NotificationKey.updateStock)
        NotificationCenter.default.addObserver(self, selector: #selector(self.refreshStock), name: nameUpdateStock, object: nil)
    }
    
    private func roundEdgeOfImage() {
        for image in self.beverageImages {
            image.layer.cornerRadius = 10.0
        }
    }
    
    @objc private func refreshStock() {
        guard let stockList = adminMode.manageable.stockList() else { return }
        for index in 0..<stockList.count {
            self.beverageStock[index].text = Formatter.format(with: stockList[index])
        }
    }
    
    private func addStock(target: Product) {
        _ = adminMode.selectMenu(with: MenuAdmin.addStock, target: target.rawValue, amount: 1)
    }
}
