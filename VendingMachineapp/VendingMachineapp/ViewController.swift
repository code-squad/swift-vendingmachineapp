//
//  ViewController.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    var buttonDictionary: [UIButton:Beverage] = [:]
    var labelDictionary: [UIButton:UILabel] = [:]
    var productList: [Beverage] = []
    
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
    
    var vendingMachine = VendingMachine()
    var wholeBeverageList: [Beverage:Int] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        mainStackView.backgroundColor = .systemGray2
 
        productList = vendingMachine.initializeProductList()
        wholeBeverageList = vendingMachine.wholeBeverage()
                
        mappingButtonAndLabel()
        mappingButtonAndProduct()
        
        setButtonsTitle()
        setLabelsTitle()

        addThousandButton.setTitle("+1000", for: .normal)
        addFiveThousandButton.setTitle("+5000", for: .normal)
        currentChangeLabel.text = "잔액 : \(vendingMachine.checkChagne().money)원"
    }
    
    @IBAction func addButtonTouched(_ sender: UIButton) {
        
        vendingMachine.add(beverage: buttonDictionary[sender.self]!)
        wholeBeverageList = vendingMachine.wholeBeverage()
        labelDictionary[sender.self]?.text = String(wholeBeverageList[buttonDictionary[sender.self]!] ?? 0)
    }
    
    @IBAction func ThousandButtonTouched(_ sender: UIButton) {
        vendingMachine.increase(money: Money(with: 1000))
        currentChangeLabel.text = "잔액 : \(vendingMachine.checkChagne().money)원"
    }
    
    @IBAction func FiveThousandButtonTouched(_ sender: UIButton) {
        vendingMachine.increase(money: Money(with: 5000))
        currentChangeLabel.text = "잔액 : \(vendingMachine.checkChagne().money)원"
    }
    
    func mappingButtonAndProduct() {
        for (button, product) in zip(beverageButtons, productList) {
            buttonDictionary.updateValue(product, forKey: button)
        }
    }
    
    func mappingButtonAndLabel() {
        for (button, label) in zip(beverageButtons, beverageLabels) {
            labelDictionary.updateValue(label, forKey: button)
        }
    }
    
    func setButtonsTitle() {
        for index in 0..<beverageButtons.count {
            beverageButtons[index].setTitle("추가", for: .normal)
        }
    }
    
    func setLabelsTitle() {
        for (key, value) in buttonDictionary {
            labelDictionary[key]?.text = String(wholeBeverageList[value] ?? 0)
        }
    }
}
