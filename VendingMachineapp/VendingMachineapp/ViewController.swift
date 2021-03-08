//
//  ViewController.swift
//  VendingMachineapp
//
//  Created by 심영민 on 2021/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    let imageArray = [
        "top", "cantata", "georgia",
        "coke", "sprite", "fanta",
        "strawberry", "banana", "choco"
    ]
    var buttonDictionary: [UIButton:Beverage] = [:]
    var labelDictionary: [UIButton:UILabel] = [:]
    var productList: [Beverage] = []
    
    @IBOutlet var mainStackView: UIStackView!
    @IBOutlet var lineStackView: [UIStackView]!
    @IBOutlet var beverageStackView: [UIStackView]!
    
    @IBOutlet weak var informationStackView: UIStackView!
    @IBOutlet weak var addThousandButton: UIButton!
    @IBOutlet weak var addFiveThousandButton: UIButton!

    @IBOutlet weak var currentChangeLabel: UILabel!
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var imageViews: [BeverageImageView]!
    @IBOutlet var labels: [UILabel]!
    
    var vendingMachine = VendingMachine(money: 1000)
    var wholeBeverageList: [Beverage:Int] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        mainStackView.backgroundColor = .systemGray2
        
        productList = vendingMachine.initializeProductList()
        wholeBeverageList = vendingMachine.wholeBeverage()
        
        setButtons()
        setLabels()
        
        addThousandButton.setTitle("+1000", for: .normal)
        addFiveThousandButton.setTitle("+5000", for: .normal)
        currentChangeLabel.text = "잔액 : \(vendingMachine.checkChagne().money)원"
        
        for (button, product) in zip(buttons, productList) {
            buttonDictionary.updateValue(product, forKey: button)
        }
    
        for (button, label) in zip(buttons, labels) {
            labelDictionary.updateValue(label, forKey: button)
        }
    }
    
    @IBAction func addButtonTouched(_ sender: UIButton) {
        vendingMachine.addBeverage(beverage: buttonDictionary[sender.self]!)
        wholeBeverageList = vendingMachine.wholeBeverage()
        labelDictionary[sender.self]?.text = String(wholeBeverageList[buttonDictionary[sender.self]!] ?? 0)
    }
    
    @IBAction func ThousandButtonTouched(_ sender: UIButton) {
        vendingMachine.increaseMoney(money: 1000)
        currentChangeLabel.text = "잔액 : \(vendingMachine.checkChagne().money)원"
    }
    
    @IBAction func FiveThousandButtonTouched(_ sender: UIButton) {
        vendingMachine.increaseMoney(money: 5000)
        currentChangeLabel.text = "잔액 : \(vendingMachine.checkChagne().money)원"
    }
    
    func setLabels() {
        wholeBeverageList = vendingMachine.wholeBeverage()
        var index = 0
        for label in labels {
            label.text = String(wholeBeverageList[productList[index]] ?? 0)
            index += 1
        }
    }
    
    func setButtons() {
        for button in buttons {
            button.setTitle("추가", for: .normal)
        }
    }

}
