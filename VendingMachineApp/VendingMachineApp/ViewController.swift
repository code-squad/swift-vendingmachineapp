//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/22.
//

import UIKit

class ViewController: UIViewController {
    let machine = Machine()
    
    @IBOutlet weak var moneyOnTransactionLabel: UILabel!
    @IBOutlet weak var beverageDisplaySlotsFirstRow: UIStackView!
    @IBOutlet weak var beverageDisplaySlotsSecondRow: UIStackView!
    
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
        
        addBeveragesOnDisplaySlots()
        addEmptyPlacesOnDisplaySlots()
        updateBeverageDisplaySlotsFirstRow()
        updateBeverageDisplaySlotsSecondRow()
    }
    
    @IBAction func thousandWonPlusButtonPressed(_ sender: UIButton) {
        machine.receiveMoney(amount: 1_000)
    }
    
    @IBAction func fiveThousandWonPlusButtonPressed(_ sender: UIButton) {
        machine.receiveMoney(amount: 5_000)
    }
    
    func createBeverageView(beverage: Beverage, count: Int) -> BeverageView {
        let view = BeverageView(with: beverage)
        view.stockAddButton.addAction(UIAction.init(handler: { (touch) in
            self.machine.addStock(beverage: beverage, amount: 1)
        }), for: .touchUpInside)
        return view
    }
    
    func addBeveragesOnDisplaySlots() {
        let stock = machine.checkStock()
        
        for (index, item) in stock.enumerated() {
            let view = createBeverageView(beverage: item.key, count: item.value)
            
            if index < 5 {
                beverageDisplaySlotsFirstRow.addArrangedSubview(view)
            } else {
                beverageDisplaySlotsSecondRow.addArrangedSubview(view)
            }
        }
    }
    
    func addEmptyPlacesOnDisplaySlots() {
        let stock = machine.checkStock()
        
        if stock.count < 5 {
            for _ in 0..<(5 - stock.count) {
                beverageDisplaySlotsFirstRow.addArrangedSubview(UIView())
            }
        } else if stock.count < 10 {
            for _ in 0..<(10 - stock.count) {
                beverageDisplaySlotsSecondRow.addArrangedSubview(UIView())
            }
        }
    }
    
    func updateBeverageDisplaySlotsFirstRow() {
        for view in beverageDisplaySlotsFirstRow.arrangedSubviews {
            guard let beverageView = view as? BeverageView else { return }
            let beverage = beverageView.boundBeverage
            guard let beverageCount = machine.checkStock()[beverage] else { return }
            beverageView.setStockLabelText(with: beverageCount)
        }
    }
    
    func updateBeverageDisplaySlotsSecondRow() {
        for view in beverageDisplaySlotsSecondRow.arrangedSubviews {
            guard let beverageView = view as? BeverageView else { return }
            let beverage = beverageView.boundBeverage
            guard let beverageCount = machine.checkStock()[beverage] else { return }
            beverageView.setStockLabelText(with: beverageCount)
        }
    }
    
    @objc func didChangeMoneyOnTransaction() {
        self.moneyOnTransactionLabel.text = "\(machine.showInsertedCashBalance())원"
    }
    
    @objc func didIncreaseStock() {
        updateBeverageDisplaySlotsFirstRow()
        updateBeverageDisplaySlotsSecondRow()
    }
}

