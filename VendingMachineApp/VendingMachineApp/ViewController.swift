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
        
        let someBeverage = Beverage(brand: "동아제약", size: 120, price: 1082, name: "박카스", packageTime: Date())
        let someStrawBerryMilk = StrawBerryMilk(brand: "남양유업", size: 180, price: 1000, name: "딸기에몽", packageTime: Date(), milkFarm: DomesticLocation(), strawBerryFarm: OverseasLocation(country: "이스라엘"), foodColoring: FoodColoring(color: "Red"))
        let someBananaMilk = BananaMilk(brand: "빙그레", size: 240, price: 1500, name: "바나나맛우유", packageTime: Date(), milkFarm: DomesticLocation(), bananaFarm: OverseasLocation(country: "인도"), foodColoring: FoodColoring(color: "Yellow"))
        let someCola = Cola(brand: "코카콜라", size: 190, price: 800, name: "코카-콜라", packageTime: Date())
        let someAmericano = Americano(brand: "스타벅스", size: 355, price: 4100, name: "아메리카노-톨", packageTime: Date(), bean: .robusta, caffeine: 150, inHeatingCabinet: false)
        let someAmericano2 = Americano(brand: "스타벅스", size: 355, price: 4100, name: "콜드브루블랙", packageTime: Date(), bean: .robusta, caffeine: 150, inHeatingCabinet: false)
        
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
        view.stockAddButton.addAction(for: .touchUpInside) { (uibutton) in
            self.machine.addStock(beverage: beverage, amount: 1)
        }
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

