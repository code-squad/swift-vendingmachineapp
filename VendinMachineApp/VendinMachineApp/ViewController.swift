

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
 
        NotificationCenter.default.addObserver(self, selector: #selector(updateCurrentCash(notification:)), name: VendingMachine.insertCash, object: appDelegate.vendingMachine)
        NotificationCenter.default.addObserver(self, selector: #selector(updateBeverageStock(notification:)), name: VendingMachine.addBeverageStock, object: appDelegate.vendingMachine)
        
        
        NotificationCenter.default.post(name: VendingMachine.insertCash, object: appDelegate.vendingMachine, userInfo: [VendingMachine.NotificationUserInfo.cashBox :appDelegate.vendingMachine.cashBox])
        NotificationCenter.default.post(name: VendingMachine.addBeverageStock, object: appDelegate.vendingMachine, userInfo: [VendingMachine.NotificationUserInfo.beverageStock :appDelegate.vendingMachine.totalBeverageStockList()])
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
    }

    @objc func updateCurrentCash(notification: Notification) {
        if let cash = notification.userInfo?[VendingMachine.NotificationUserInfo.cashBox] as? Int {
            cashLabel.text = "\(cash)"
        }
    }
    
    @objc func updateBeverageStock(notification: Notification) {
        if let totalBeverages = notification.userInfo?[VendingMachine.NotificationUserInfo.beverageStock] as? Beverages {
            for (beverageLabel, beverageType) in zip(beverageStockLabels, vendingMachineElements.beverageList) {
                beverageLabel.text = "\(totalBeverages.beverageCount(elementType: beverageType))"
            }
        }
    }
}


