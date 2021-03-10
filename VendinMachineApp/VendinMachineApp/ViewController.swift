

import UIKit

class ViewController: UIViewController {

    @IBOutlet var beverageImages: [UIImageView]!
    @IBOutlet var beverageButtons: [UIButton]!
    
    private var addBeverageButtons: [UIButton:Beverage.Type] = [:]
    
    var vendingMachine = VendingMachine()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpBeverageImages()
        setUpAddBeverageButtons()
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
        let beverageList = [BananaMilk.self, ChocoMilk.self, Coke.self, Cider.self, Americano.self, Latte.self]
        for (button, beverageType) in zip(beverageButtons, beverageList) {
            addBeverageButtons.updateValue(beverageType, forKey: button)
        }
    }
    
    @IBAction func beverageMake(_ sender: UIButton) {
        guard let beverageType = addBeverageButtons[sender] else {
            return
        }
        let beverage = BeverageFactory.make(beverage: beverageType)
        vendingMachine.addBeverageStock(beverage)
        print(vendingMachine.totalBeverageStockList())
    }
    
}


