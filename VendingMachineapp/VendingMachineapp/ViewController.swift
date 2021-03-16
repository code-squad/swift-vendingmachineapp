//
//  ViewController.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    var buttonDictionary: [UIButton:Beverage] = [:]
    var labelDictionary: [Beverage:UILabel] = [:]
    
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet var lineStackView: [UIStackView]!
    @IBOutlet var beverageStackView: [UIStackView]!
    @IBOutlet weak var informationStackView: UIStackView!
    @IBOutlet weak var addThousandButton: UIButton!
    @IBOutlet weak var addFiveThousandButton: UIButton!
    @IBOutlet weak var currentChangeLabel: UILabel!
    @IBOutlet var beverageButtons: [UIButton]!
    @IBOutlet var beverageImageViews: [BeverageImageView]!
    @IBOutlet var beverageLabels: [UILabel]!
    
    var delegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainStackView.backgroundColor = .systemGray2
        
        mappingButtonAndLabel()
        mappingButtonAndProduct()
        
        setButtonsTitle()
        setLabelsTitle()
        setObserver()
    }
    
    func setObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(changeStockLabel),
                                               name: VendingMachine.Notification.didChangedStock,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(changeMoneyLabel),
                                               name: VendingMachine.Notification.didChangedMoney,
                                               object: nil)
    }
    
    @IBAction func addButtonTouched(_ sender: UIButton) {
        delegate.vendingMachine.add(beverage: buttonDictionary[sender.self]!)
    }
    
    @IBAction func ThousandButtonTouched(_ sender: UIButton) {
        delegate.vendingMachine.increase(money: Money(with: 1000))
    }
    
    @IBAction func FiveThousandButtonTouched(_ sender: UIButton) {
        delegate.vendingMachine.increase(money: Money(with: 5000))
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
    
    func setButtonsTitle() {
        for index in 0..<beverageButtons.count {
            beverageButtons[index].setTitle("추가", for: .normal)
        }
        
        addThousandButton.setTitle("+1000", for: .normal)
        addFiveThousandButton.setTitle("+5000", for: .normal)
    }
    
    func setLabelsTitle() {
        for (product, label) in labelDictionary {
            label.text = "\(delegate.vendingMachine.wholeBeverage()[product] ?? 0)"
        }
        
        currentChangeLabel.text = "잔액 : \(delegate.vendingMachine.checkChagne().money)원"
    }
    
    @objc func changeStockLabel(_ notification: Notification) {
        if let list = notification.userInfo as? [Beverage:Int] {
            for (beverage, number) in list {
                labelDictionary[beverage]?.text = "\(number)"
            }
        }
    }
    
    @objc func changeMoneyLabel(_ notification: Notification) {
        currentChangeLabel.text = "잔액 : \(delegate.vendingMachine.checkChagne().money)원"
    }
}
