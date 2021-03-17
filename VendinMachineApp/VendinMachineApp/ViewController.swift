

import UIKit

class ViewController: UIViewController {

    @IBOutlet var beverageImages: [UIImageView]!
    @IBOutlet var beverageAddButtons: [UIButton]!
    @IBOutlet var beverageStockLabels: [UILabel]!
    
    @IBOutlet var cashButtons: [UIButton]!
    @IBOutlet weak var cashLabel: UILabel!

    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    var vendingMachineElements = VendingMachineElements()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        vendingMachineElements.setUpAll(images: beverageImages, beverageButtons: beverageAddButtons, cashButtons: cashButtons)
        updateCurrentCash(label: cashLabel, cashBox: appDelegate.vendingMachine.cashBox)
        updateBeverageStock(labels: beverageStockLabels, beverageStock: appDelegate.vendingMachine.totalBeverageStockList(), beverageTypeList: vendingMachineElements.beverageList)
    }
    
    @IBAction func beverageMake(_ sender: UIButton) {
        guard let beverageType = vendingMachineElements.pressedAddBeverage(button: sender) else {
            return
        }
        let beverage = BeverageFactory.make(beverage: beverageType)
        appDelegate.vendingMachine.addBeverageStock(beverage)
        vendingMachineElements.updateBeverageStock(labels: beverageStockLabels, beverageStock: appDelegate.vendingMachine.totalBeverageStockList())
    }
    
    @IBAction func insertCash(_ sender: UIButton) {
        guard let cash = vendingMachineElements.pressedInsertCash(button: sender) else {
            return
        }
        appDelegate.vendingMachine.insertCash(amount: cash)
        vendingMachineElements.updateCurrentCash(label: cashLabel, cashBox: appDelegate.vendingMachine.cashBox)
    }
    
    func updateCurrentCash(label: UILabel, cashBox: Int) {
        label.text = "\(cashBox)"
    }
    
    func updateBeverageStock(labels: [UILabel], beverageStock: Beverages, beverageTypeList: [Beverage.Type]) {
        for (beverageLabel, beverageType) in zip(labels, beverageTypeList) {
            beverageLabel.text = "\(beverageStock.beverageCount(elementType: beverageType))"
        }
    }
}


