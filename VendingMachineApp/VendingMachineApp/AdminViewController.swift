//
//  AdminViewController.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 7. 12..
//  Copyright © 2018년 moon. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController, StockCheckale {

    @IBOutlet var stockLabels: [UILabel]!
    @IBOutlet var stockImageViews: [UIImageView]!
    @IBOutlet var addStockButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStockLabels()
        setupNotification()
        stockImageViews.forEach {
            $0.backgroundColor = UIColor.white
            $0.layer.borderWidth  = 5
            $0.layer.cornerRadius = 15
        }
    }
    
    func setupNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.didChangeStock(notification:)), name: .didChangeStock, object: nil)
    }
    
    @objc private func didChangeStock(notification: Notification) {
        self.updateStockLabels()
    }
    
    @IBAction func tappedBackButton(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addStock(_ sender: UIButton) {
        guard let buttonIndex = self.addStockButtons.index(of: sender) else { return }
        guard let beverage = BeverageFactory.makeBeverage(meunNumber: buttonIndex) else { return }
        VendingMachine.shared().addBeverage(beverage)
    }

}
