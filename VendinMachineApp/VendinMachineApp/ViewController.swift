

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
        
        vendingMachineElements.setUpAll(images: beverageImages, beverageButtons: beverageAddButtons, beverageStockLabels: beverageStockLabels, beverageStock: appDelegate.vendingMachine.totalBeverageStockList(), cashButtons: cashButtons, cashLabel: cashLabel, cashBox: appDelegate.vendingMachine.cashBox)
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
    
}


