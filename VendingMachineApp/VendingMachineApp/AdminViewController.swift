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
    @IBOutlet weak var purchasePieGraph: PieGraphView!

    private weak var vendingMachine: AdminMode?
    private var purchases: [Beverage] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        registerAsObserver()
        updateAllQuantityLabels()
        purchasePieGraph.historyDataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        updateHistoryOfPurchase()
    }

    func set(vendingMachine: AdminMode?) {
        self.vendingMachine = vendingMachine
    }

    private func registerAsObserver() {
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(showQuantities(_:)), name: .inventoryDataChanged, object: nil)
    }

    private func updateOneQuantityLabel(at index: Int) {
        let count =  vendingMachine?.count(beverage: index)
        beverageLabels[index].text = "\(count ?? 0)개"
    }

    private func updateAllQuantityLabels() {
        for index in beverageLabels.indices {
            updateOneQuantityLabel(at: index)
        }
    }

    @objc private func showQuantities(_ notification: Notification) {
        if let beverage = notification.userInfo?[Notification.InfoKey.beverageQuantityChanged] as? BeverageSubCategory {
            let index = beverage.rawValue
            updateOneQuantityLabel(at: index)
            return
        }
        updateAllQuantityLabels()
    }

    @IBAction func addBeverageButtonTouched(_ sender: UIButton) {
        guard let beverage = BeverageSubCategory(rawValue: sender.tag) else { return }
        guard let vendingMachine = vendingMachine else { return }
        vendingMachine.add(beverage: beverage)
    }

    @IBAction func closeButtonTouched(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}

protocol HistoryDataSource {
    var classifiedPurchase: [String: Int] { get }
}

extension AdminViewController: HistoryDataSource {

    private func updateHistoryOfPurchase() {
        let updatePoint = purchases.count
        guard let beverages = vendingMachine?.updateHistory(from: updatePoint) else { return }
        beverages.forEach { purchases.append($0) }
        purchasePieGraph.setNeedsDisplay()
    }

    var classifiedPurchase: [String: Int] {
        return purchases.reduce(into: [:]) { $0[$1.title, default: 0] += 1 }
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        super.motionEnded(motion, with: event)
        if motion == .motionShake {
            purchasePieGraph.setDefaultRadius()
        }
    }

}
