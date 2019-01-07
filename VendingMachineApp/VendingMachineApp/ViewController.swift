//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 윤지영 on 24/12/2018.
//  Copyright © 2018 윤지영. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private weak var appDelegate: AppDelegate?
    @IBOutlet var beverageImages: [UIImageView]!
    @IBOutlet var beverageLabels: [UILabel]!
    @IBOutlet weak var balance: UILabel!

    required init?(coder aDecoder: NSCoder) {
        self.appDelegate = UIApplication.shared.delegate as? AppDelegate
        super.init(coder: aDecoder)
        setVendingMachine()
    }

    private func setVendingMachine() {
        let emptyList = [ObjectIdentifier: Pack]()
        let inventory = Inventory(list: emptyList)
        appDelegate?.vendingMachine = VendingMachine(initialInventory: inventory)
    }

    private func roundImageViews() {
        for image in beverageImages {
            image.layer.cornerRadius = 15
            image.layer.masksToBounds = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        roundImageViews()
        showQuantities()
        appDelegate?.vendingMachine?.showBalance(with: balanceForm)
    }

    private func showQuantities() {
        for (index, quantity) in beverageLabels.enumerated() {
            if let count =  appDelegate?.vendingMachine?.count(beverage: index) {
                quantity.text = "\(count)개"
                continue
            }
            quantity.text = "0개"
        }
    }

    @IBAction func addBeverage(_ sender: UIButton) {
        guard let beverage = BeverageSubCategory(rawValue: sender.tag) else { return }
        guard appDelegate?.vendingMachine?.add(beverage: beverage) ?? false else { return }
        showQuantities()
    }

    private func balanceForm(money: Int) {
        self.balance.text = "잔액: \(money)원"
    }

    private func insert(money: Money) {
        guard appDelegate?.vendingMachine?.insert(money: money) ?? false else { return }
        appDelegate?.vendingMachine?.showBalance(with: balanceForm)
    }

    @IBAction func insertOneThousand(_ sender: Any) {
        insert(money: Money(unit: .oneThousand))
    }

    @IBAction func insertFiveThousands(_ sender: Any) {
        insert(money: Money(unit: .fiveThousands))
    }

}

