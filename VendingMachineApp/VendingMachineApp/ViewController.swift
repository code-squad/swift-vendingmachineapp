//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inventoryStackView: UIStackView!
    @IBOutlet weak var moneyLabel: UILabel!
  
    private var imageViewInitializer: [ObjectIdentifier: BeverageView] = [:]
    private var updateModelHelper: [UIButton: Beverage.Type] = [:]
    private var updateLabelHelper: [UIButton: UILabel] = [:]
    private var vendingMachine = VendingMachine()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        vendingMachine.appendInventory(FactoryManager.create(type: MilkFactory.self))
        vendingMachine.appendInventory(FactoryManager.create(type: SodaFactory.self))
        vendingMachine.appendInventory(FactoryManager.create(type: CoffeeFactory.self))
        
        initialize()
    }

    private func initialize() {
        makeBaverageViews()
        view.addSubview(inventoryStackView)
    }
    
    func makeBaverageViews() {
        initImageViewInitializer()

        imageViewInitializer.keys.forEach { key in
            guard let beverageView = imageViewInitializer[key] else {
                return
            }
            inventoryStackView.addArrangedSubview(beverageView)
        }
    }
    
    private func initImageViewInitializer() {
        imageViewInitializer.removeAll()
        
        let beverages = vendingMachine.showAllBeverageList()
        beverages.keys.forEach { key in
            if let beverage = beverages[key]?.first {
                let image = UIImage(named: beverage.name) ?? UIImage()
                let text = "\(beverages[key]?.count ?? 0)"
                let beverageView =  BeverageView(beverageImage: image, stockLabelText: text )
                beverageView.addButton.addTarget(self, action: #selector(addBeverage), for: .touchUpInside)

                imageViewInitializer[key] = beverageView
                updateModelHelper[beverageView.addButton] = type(of: beverage)
                updateLabelHelper[beverageView.addButton] = beverageView.stockLabel
            }
        }
    }
    
    @objc
    func addBeverage(_ sender: UIButton!) {
        guard let beverage = updateModelHelper[sender]?.init() else {
            return
        }
        vendingMachine.appendInventory(beverage)
        updateLabelHelper[sender]!.text = "\(vendingMachine.showAllBeverageList()[ObjectIdentifier(type(of: beverage))]?.count ?? 0)"
    }
    
    @IBAction func addMoney5000(_ sender: Any) {
        vendingMachine.put(in: .fiveThousand)
        moneyLabel.text = "잔액: \(vendingMachine.showCurrentMoney()) 원"
    }
    
    @IBAction func addMoney1000(_ sender: Any) {
        vendingMachine.put(in: .thousand)
        moneyLabel.text = "잔액: \(vendingMachine.showCurrentMoney()) 원"
    }
}
