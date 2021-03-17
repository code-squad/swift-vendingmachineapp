//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/22.
//

import UIKit

class ViewController: UIViewController {
    var machine = (UIApplication.shared.delegate as! AppDelegate).machine ?? Machine()
    var purchaseHistoryView = PurchaseHistoryScrollView()
    
    @IBOutlet weak var moneyOnTransactionLabel: UILabel!
    @IBOutlet weak var displayRows: UIStackView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(didChangeMoneyOnTransaction), name: .didIncreaseMoneyOnTransaction, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didIncreaseStock), name: .didIncreaseStock, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didChangePurchaseHistory), name: .didChangePurchaseHistory, object: nil)
        
        addBeveragesOnDisplayRows()
        addEmptySlotsOnDisplayRows()
        updateBeverageDisplaySlots()
        updateMoneyOnTransactionLabel()
        
        self.view.addSubview(purchaseHistoryView)
        purchaseHistoryView.frame = CGRect(x: 40, y: 575, width: 500, height: 140)
        
    }
    
    @IBAction func thousandWonPlusButtonPressed(_ sender: UIButton) {
        machine.receiveMoney(amount: 1_000)
    }
    
    @IBAction func fiveThousandWonPlusButtonPressed(_ sender: UIButton) {
        machine.receiveMoney(amount: 5_000)
    }
    
    func createBeverageView(with beverage: Beverage, of count: Int) -> BeverageView {
        let view = BeverageView(with: beverage)
        view.stockAddButton.addAction(UIAction.init(handler: { (touch) in
            self.machine.increaseStock(beverage: beverage, amount: 1)
        }), for: .touchUpInside)
        view.purchaseButton.addAction(UIAction.init(handler: { (touch) in
            self.machine.purchaseBeverage(beverage: beverage)
        }), for: .touchUpInside)
        return view
    }
    
    func addBeveragesOnDisplayRows() {
        let stock = machine.checkStock()
        
        for (index, item) in stock.enumerated() {
            let row = displayRows.arrangedSubviews[index / 5] as! UIStackView
            let view = createBeverageView(with: item.beverage, of: item.count)
            row.addArrangedSubview(view)
        }
    }
    
    func addEmptySlotsOnDisplayRows() {
        displayRows.arrangedSubviews.forEach {
            guard let horizontalStack = $0 as? UIStackView else { return }

            while horizontalStack.arrangedSubviews.count < 5 {
                horizontalStack.addArrangedSubview(UIView())
            }
        }
    }
    
    func updateBeverageDisplaySlots() {
        displayRows.arrangedSubviews.forEach {
            guard let horizontalStack = $0 as? UIStackView else { return }
            horizontalStack.arrangedSubviews.forEach {
                guard let beverageView = $0 as? BeverageView else { return }
                let count = machine.checkSpecificTypeOfBeverage(beverage: beverageView.boundBeverage)
                beverageView.setStockLabelText(with: count)
            }
        }
    }
    
    func updateMoneyOnTransactionLabel() {
        self.moneyOnTransactionLabel.text = "\(machine.showInsertedCashBalance())원"
    }
    
    @objc func didChangeMoneyOnTransaction() {
        updateMoneyOnTransactionLabel()
    }
    
    @objc func didIncreaseStock() {
        updateBeverageDisplaySlots()
    }
    
    @objc func didChangePurchaseHistory() {
        updateBeverageDisplaySlots()
        updateMoneyOnTransactionLabel()
    }
}

