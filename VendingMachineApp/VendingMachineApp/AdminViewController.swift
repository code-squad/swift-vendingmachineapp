//
//  AdminViewController.swift
//  VendingMachineApp
//
//  Created by 윤지영 on 17/01/2019.
//  Copyright © 2019 윤지영. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController {
    @IBOutlet var beverageImages: [RoundedCornersImageView]!
    @IBOutlet var beverageLabels: [UILabel]!

    private weak var vendingMachine: VendingMachine?

    override func viewDidLoad() {
        super.viewDidLoad()
        registerAsObserver()
    }

    override func viewWillAppear(_ animated: Bool) {
        updateAllQuantityLabels()
    }

    func set(vendingMachine: VendingMachine) {
        self.vendingMachine = vendingMachine
    }

    private func registerAsObserver() {
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(showQuantities(_:)), name: .inventoryDataChanged, object: nil)
    }

    private func updateOneQuantityLabel(of index: Int) {
        let count =  vendingMachine?.count(beverage: index)
        beverageLabels[index].text = "\(count ?? 0)개"
    }

    private func updateAllQuantityLabels() {
        for index in beverageLabels.indices {
            updateOneQuantityLabel(of: index)
        }
    }

    @objc private func showQuantities(_ notification: Notification) {
        if let index = notification.userInfo?[Notification.InfoKey.indexOfBeverage] as? Int {
            updateOneQuantityLabel(of: index)
            return
        }
        updateAllQuantityLabels()
    }

    @IBAction func addBeverage(_ sender: UIButton) {
        guard let beverage = BeverageSubCategory(rawValue: sender.tag) else { return }
        guard let vendingMachine = vendingMachine else { return }
        vendingMachine.add(beverage: beverage)
    }

}
