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

    var delegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize()
    }

    private func initialize() {
        makeBaverageViews()
        view.addSubview(inventoryStackView)
        initMoneyLabelText()
    }
    
    private func initMoneyLabelText() {
        moneyLabel.text = "잔액: \(delegate.vendingMachine.showCurrentMoney()) 원"
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
        
        let beverages = delegate.vendingMachine.showAllBeverageList()
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
        delegate.vendingMachine.appendInventory(beverage)
        updateLabelHelper[sender]!.text = "\(delegate.vendingMachine.showAllBeverageList()[ObjectIdentifier(type(of: beverage))]?.count ?? 0)"
    }
    
    @IBAction func addMoney5000(_ sender: Any) {
        delegate.vendingMachine.put(in: .fiveThousand)
        initMoneyLabelText()
    }
    
    @IBAction func addMoney1000(_ sender: Any) {
        delegate.vendingMachine.put(in: .thousand)
        initMoneyLabelText()
    }
}
