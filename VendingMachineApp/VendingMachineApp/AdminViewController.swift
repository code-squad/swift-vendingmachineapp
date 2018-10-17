//
//  AdminViewController.swift
//  VendingMachineApp
//
//  Created by oingbong on 17/10/2018.
//  Copyright © 2018 oingbong. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController, Operable {
    private let adminMode = AdminMode(with: VendingMachine.shared)
    
    @IBOutlet var beverageStock: [UILabel]!
    @IBOutlet var beverageImages: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createdObservers()
        roundEdgeOfImage()
        refreshStock()
    }
    
    func createdObservers() {
        // addStock
        let nameUpdateStock = Notification.Name(NotificationKey.updateStock)
        NotificationCenter.default.addObserver(self, selector: #selector(self.refreshStock), name: nameUpdateStock, object: nil)
    }
    
    func roundEdgeOfImage() {
        for image in self.beverageImages {
            image.layer.cornerRadius = 10.0
        }
    }
    
    @objc func refreshStock() {
        guard let stockList = adminMode.manageable.stockList() else { return }
        for index in 0..<stockList.count {
            self.beverageStock[index].text = Formatter.format(with: stockList[index])
        }
    }
    
    @IBAction func closeBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tappedAddBeverageBtn(_ sender: UIButton) {
        if let selectedBeverage = Product(rawValue: sender.tag) {
            addStock(target: selectedBeverage)
        }
    }
    
    private func addStock(target: Product) {
        _ = adminMode.selectMenu(with: MenuAdmin.addStock, target: target.rawValue, amount: 1)
    }
}
