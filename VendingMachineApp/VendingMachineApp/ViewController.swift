//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Elena on 07/05/2019.
//  Copyright © 2019 elena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - private variable
    private var vendingMachine: VendingMachine?
    
    // MARK: - @IBOutlet
    @IBOutlet var beverageImageView: [RoundImageView]!
    @IBOutlet var beverageLabel: [UILabel]!
    @IBOutlet weak var list: UILabel!

    // MARK: - init
    required init?(coder aDecoder: NSCoder) {
        self.vendingMachine = VendingMachine.shared
        super.init(coder: aDecoder)
    }
    
    // MARK: - function
    private func showQuantity() {
        for (index, count) in beverageLabel.enumerated() {
            if let number = vendingMachine?.count(beverage: index) {
                count.text = "\(number)개"
                continue
            }
            count.text = "0개"
        }
    }
    
    private func moneyFormat(money: Int) {
        self.list.text = "\(money.commaRepresentation)"
    }
    
    // MARK: - @IBAction
    @IBAction func addBeverage(_ sender: UIButton) {
        let beverage = sender.tag
        guard vendingMachine?.add(beverage: beverage) ?? false else { return }
        
        showQuantity()
    }
    
    @IBAction func inputMoney(_ sender: UIButton) {
        switch sender.tag {
        case 0: vendingMachine?.isPut(cash: AvailableMoney.oneThousand.value)
        case 1: vendingMachine?.isPut(cash: AvailableMoney.fiveThousands.value)
        default:
            return
        }
        vendingMachine?.showList(show: moneyFormat)
    }
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showQuantity()
        vendingMachine?.showList(show: moneyFormat)

    }
}
