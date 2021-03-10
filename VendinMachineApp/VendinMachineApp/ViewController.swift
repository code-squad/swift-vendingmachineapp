

import UIKit

class ViewController: UIViewController {

    @IBOutlet var beverageImages: [UIImageView]!
    @IBOutlet var beverageButtons: [UIButton]!
    @IBOutlet var beverageLabels: [UILabel]!
    
    @IBOutlet var cashButtons: [UIButton]!
    @IBOutlet weak var cashLabel: UILabel!
    
    let beverageList = [BananaMilk.self, ChocoMilk.self, Coke.self, Cider.self, Americano.self, Latte.self]
    private var addBeverageButtons: [UIButton:Beverage.Type] = [:]
    private var insertCashButtons: [UIButton:Int] = [:]
    
    var vendingMachine = VendingMachine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpBeverageImages()
        setUpAddBeverageButtons()
        setUpInsertCashButtons()
        updateBeverageLabels()
        updateCurrentCash()
    }

    func setUpBeverageImages() {
        beverageImages.forEach { imageView in
            imageView.contentMode = .scaleToFill
            imageView.layer.borderWidth = 2
            imageView.layer.borderColor = UIColor.lightGray.cgColor
            imageView.layer.cornerRadius = 10
        }
    }

    func setUpAddBeverageButtons() {
        for (button, beverageType) in zip(beverageButtons, beverageList) {
            addBeverageButtons.updateValue(beverageType, forKey: button)
        }
    }
    
    func setUpInsertCashButtons() {
        let moneyValue = [1000, 5000]
        for (button, money) in zip(cashButtons, moneyValue) {
            insertCashButtons.updateValue(money, forKey: button)
        }
    }
    
    func updateBeverageLabels() {
        for (beverageLabel, beverageType) in zip(beverageLabels, beverageList) {
            beverageLabel.text = "\(vendingMachine.beverageCount(beverageType: beverageType))"
        }
    }
    
    func updateCurrentCash() {
        cashLabel.text = "\(vendingMachine.cashBox)"
    }
    
    @IBAction func beverageMake(_ sender: UIButton) {
        guard let beverageType = addBeverageButtons[sender] else {
            return
        }
        let beverage = BeverageFactory.make(beverage: beverageType)
        vendingMachine.addBeverageStock(beverage)
        updateBeverageLabels()
    }
    
    @IBAction func insertCash(_ sender: UIButton) {
        guard let cash = insertCashButtons[sender] else {
            return
        }
        vendingMachine.insertCash(amount: cash)
        updateCurrentCash()
    }
    
}


