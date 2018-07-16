//
//  AdminViewController.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 7. 12..
//  Copyright © 2018년 moon. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController, StockCheckable {

    @IBOutlet var stockLabels: [UILabel]!
    @IBOutlet var stockImageViews: [UIImageView]!
    @IBOutlet var addStockButtons: [UIButton]!
    @IBOutlet weak var pieGraphView: PieGraphView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateStockLabels()
        setupNotification()
        stockImageViews.forEach { $0.setBeverageImage() }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        pieGraphView.setCountList(VendingMachine.shared().readHistoryCountList())
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

extension UIImageView {
    func setBeverageImage() {
        self.backgroundColor = UIColor.white
        self.layer.borderWidth = 5
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
    }
}

