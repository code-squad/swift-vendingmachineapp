//
//  ViewController.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    private var buttonDictionary: [UIButton:Beverage] = [:]
    private var purchaseButtonDictionary: [UIButton:Beverage] = [:]
    private var labelDictionary: [Beverage:UILabel] = [:]
    private var moneyButtonDictionary: [UIButton:Int] = [:]
    
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet var lineStackView: [UIStackView]!
    @IBOutlet var beverageStackView: [UIStackView]!
    @IBOutlet weak var informationStackView: UIStackView!
    @IBOutlet weak var currentChangeLabel: UILabel!
    @IBOutlet var addMoneyButtons: [UIButton]!
    @IBOutlet var beverageButtons: [UIButton]!
    @IBOutlet var purchaseButtons: [UIButton]!
    @IBOutlet var beverageImageViews: [BeverageImageView]!
    @IBOutlet var beverageLabels: [UILabel]!
    
    var delegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainStackView.backgroundColor = .systemGray2
        
        mappingButtonAndLabel()
        mappingButtonAndProduct()
        mappingButtonAndMoney()
        mappingPurchaseButtonAndProduct()
        
        setButtonsTitle()
        setLabelsTitle()
        setObserver()
    }
    
    func setObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(changeStockLabel),
                                               name: VendingMachine.Notification.didChangedStock,
                                               object: delegate.vendingMachine)
        
        NotificationCenter.default.addObserver(self, selector: #selector(changeMoneyLabel),
                                               name: VendingMachine.Notification.didChangedMoney,
                                               object: delegate.vendingMachine)
    }
    
    @IBAction func addButtonTouched(_ sender: UIButton) {
        delegate.vendingMachine.add(beverage: buttonDictionary[sender.self]!)
    }
    
    @IBAction func moneyButtonTouched(_ sender: UIButton) {
        delegate.vendingMachine.increase(money: Money(with: moneyButtonDictionary[sender.self]!))
    }
    @IBAction func purchaseButtonTouched(_ sender: UIButton) {
        delegate.vendingMachine.purchase(beverage: type(of: purchaseButtonDictionary[sender.self]!) )
    }
    
    func mappingPurchaseButtonAndProduct() {
        for (button, product) in zip(purchaseButtons, delegate.vendingMachine.getProductList()) {
            purchaseButtonDictionary.updateValue(product, forKey: button)
        }
    }
    
    func mappingButtonAndProduct() {
        for (button, product) in zip(beverageButtons, delegate.vendingMachine.getProductList()) {
            buttonDictionary.updateValue(product, forKey: button)
        }
    }
    
    func mappingButtonAndLabel() {
        for (product, label) in zip(delegate.vendingMachine.getProductList(), beverageLabels) {
            labelDictionary.updateValue(label, forKey: product)
        }
    }
    
    func mappingButtonAndMoney() {
        for (button, money) in zip(addMoneyButtons, Money.Amount.allCases ) {
            moneyButtonDictionary.updateValue(money.rawValue, forKey: button)
        }
    }
    
    func setButtonsTitle() {
        for index in 0..<beverageButtons.count {
            beverageButtons[index].setTitle("추가", for: .normal)
            purchaseButtons[index].setTitle("구매", for: .normal)
            purchaseButtons[index].setTitleColor(.red, for: .normal)
        }
        
        for (button, money) in moneyButtonDictionary {
            button.setTitle("+\(money)", for: .normal)
        }
    }
    
    func setLabelsTitle() {
        for (product, label) in labelDictionary {
            label.text = "\(delegate.vendingMachine.wholeBeverage()[product] ?? 0)"
        }
        currentChangeLabel.text = "잔액 : \(delegate.vendingMachine.checkChange())원"
    }
    
    @objc func changeStockLabel(_ notification: Notification) {
        if let list = notification.userInfo as? [Beverage:Int] {
            for (beverage, number) in list {
                labelDictionary[beverage]?.text = "\(number)"
            }
        }
    }
    
    @objc func changeMoneyLabel(_ notification: Notification) {
        currentChangeLabel.text = "잔액 : \(delegate.vendingMachine.checkChange())원"
    }
}
