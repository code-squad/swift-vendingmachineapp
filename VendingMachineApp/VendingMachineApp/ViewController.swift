//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/22.
//

import UIKit

class ViewController: UIViewController {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    lazy var machine = appDelegate.machine
    
    @IBOutlet weak var moneyOnTransactionLabel: UILabel!
    @IBOutlet weak var displayRows: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(didChangeMoneyOnTransaction), name: .didIncreaseMoneyOnTransaction, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(didIncreaseStock), name: .didIncreaseStock, object: nil)
        
        let someBeverage = BeverageFactory.makeBeverageWithType(brand: "동아제약", price: .high, name: "박카스", packageTime: .fresh, beverageType: Beverage.self)
        let someStrawBerryMilk = BeverageFactory.makeBeverageWithType(brand: "남양유업", price: .high, name: "딸기에몽", packageTime: .fresh, beverageType: StrawBerryMilk.self)
        let someBananaMilk = BeverageFactory.makeBeverageWithType(brand: "빙그레", price: .high, name: "바나나맛우유", packageTime: .fresh, beverageType: BananaMilk.self)
        let someCola = BeverageFactory.makeBeverageWithType(brand: "코카콜라", price: .high, name: "코카콜라", packageTime: .fresh, beverageType: Cola.self)
        let someAmericano = BeverageFactory.makeBeverageWithType(brand: "스타벅스", price: .high, name: "아메리카노-톨", packageTime: .fresh, beverageType: Americano.self)
        let someAmericano2 = BeverageFactory.makeBeverageWithType(brand: "스타벅스", price: .high, name: "콜드브루블랙", packageTime: .fresh, beverageType: Americano.self)
        
        
        machine.addStock(beverage: someBeverage, amount: 10)
        machine.addStock(beverage: someStrawBerryMilk, amount: 20)
        machine.addStock(beverage: someBananaMilk, amount: 30)
        machine.addStock(beverage: someCola, amount: 40)
        machine.addStock(beverage: someAmericano, amount: 50)
        machine.addStock(beverage: someAmericano2, amount: 60)
        
        addBeveragesOnDisplayRows()
        addEmptySlotsOnDisplayRows()
        updateBeverageDisplaySlots()
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
            self.machine.addStock(beverage: beverage, amount: 1)
        }), for: .touchUpInside)
        return view
    }
    
    func addBeveragesOnDisplayRows() {
        let stock = machine.checkStock()
        
        for (index, item) in stock.enumerated() {
            let row = displayRows.arrangedSubviews[index / 5] as! UIStackView
            let view = createBeverageView(with: item.key, of: item.value)
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
        let stock = machine.checkStock()
        
        displayRows.arrangedSubviews.forEach {
            guard let horizontalStack = $0 as? UIStackView else { return }
            horizontalStack.arrangedSubviews.forEach {
                guard let beverageView = $0 as? BeverageView else { return }
                guard let count = stock[beverageView.boundBeverage] else { return }
                beverageView.setStockLabelText(with: count)
            }
        }
    }
    
    @objc func didChangeMoneyOnTransaction() {
        self.moneyOnTransactionLabel.text = "\(machine.showInsertedCashBalance())원"
    }
    
    @objc func didIncreaseStock() {
        updateBeverageDisplaySlots()
    }
}

