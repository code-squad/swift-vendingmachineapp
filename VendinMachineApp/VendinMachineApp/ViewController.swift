

import UIKit

class ViewController: UIViewController {

    @IBOutlet var beverageImages: [UIImageView]!
    @IBOutlet var beverageAddButtons: [UIButton]!
    @IBOutlet var beverageStockLabels: [UILabel]!
    
    @IBOutlet var cashButtons: [UIButton]!
    @IBOutlet weak var cashLabel: UILabel!

    var vendingMachine = VendingMachine()
    var vendingMachineElements = VendingMachineElements()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpBeverageImages()
        vendingMachineElements.setUpAddBeverage(buttons: beverageAddButtons)
        vendingMachineElements.setUpInsertCash(buttons: cashButtons)
        vendingMachineElements.updateBeverageStock(labels: beverageStockLabels, in: vendingMachine)
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
    
    func updateCurrentCash() {
        cashLabel.text = "\(vendingMachine.cashBox)"
    }
    
    @IBAction func beverageMake(_ sender: UIButton) {
        guard let beverageType = vendingMachineElements.pressedAddBeverage(button: sender) else {
            return
        }
        let beverage = BeverageFactory.make(beverage: beverageType)
        vendingMachine.addBeverageStock(beverage)
        vendingMachineElements.updateBeverageStock(labels: beverageStockLabels, in: vendingMachine)
    }
    
    @IBAction func insertCash(_ sender: UIButton) {
        guard let cash = vendingMachineElements.pressedInsertCash(button: sender) else {
            return
        }
        vendingMachine.insertCash(amount: cash)
        updateCurrentCash()
    }
    
}


