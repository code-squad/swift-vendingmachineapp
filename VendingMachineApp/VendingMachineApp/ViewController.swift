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
    private var vendingMachine: VendingMachine
    
    // MARK: - @IBOutlet
    @IBOutlet var beverageImageView: [UIImageView]!
    @IBOutlet var beverageLabel: [UILabel]!
    @IBOutlet weak var list: UILabel!
    
    // MARK: - init
    required init?(coder: NSCoder) {
        self.vendingMachine = VendingMachine(list: Inventory(list: [ObjectIdentifier: Packages]()))
        super.init(coder: coder)
    }
    
    // MARK: - function
    private func roundImageView() {
        for imgView in beverageImageView {
            imgView.layer.borderColor = UIColor.gray.cgColor
            imgView.layer.borderWidth = 2
            imgView.layer.cornerRadius = 10
            
        }
    }
    
    private func showQuantity() {
        for (index, count) in beverageLabel.enumerated() {
            if let number = vendingMachine.count(beverage: index) {
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
        guard vendingMachine.add(beverage: beverage) else { return }
        showQuantity()
    }
    
    @IBAction func inputOneThousandMoney(_ sender: Any) {
        guard vendingMachine.isPut(cash: 1000) else { return }
        vendingMachine.showList(show: moneyFormat)
    }
    
    @IBAction func inputfiveThousandMoney(_ sender: Any) {
        guard vendingMachine.isPut(cash: 5000) else { return }
        vendingMachine.showList(show: moneyFormat)
    }
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        roundImageView()
        showQuantity()
        vendingMachine.showList(show: moneyFormat)
    }

}
