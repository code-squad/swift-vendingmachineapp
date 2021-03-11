import UIKit

class VendingMachineViewController: UIViewController {
    
    let factory = BeverageFactory()
    private var vendingMachine = VendingMachine.sharedInstance()
    
    @IBOutlet var stockInfo: [UILabel]!
    @IBOutlet var imagesOfBeverages: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beveragesStockCount()
        balanceInfoLabel()
        setUpImageView()
        view.backgroundColor = UIColor.systemGray5
        NotificationCenter.default.addObserver(self, selector: #selector(updateInsertedMoney(notification:)), name: .updateInsertedMoney, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateBeverages(notification:)), name: .updateBeverages, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(resetInsertedMoney(notification:)), name: .resetInsertedMoney, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(resetBeveragesStock(notification:)), name: .resetBeverages, object: nil)
    }
    
    
    private func setUpImageView() {
        for beverage in imagesOfBeverages {
            beverage.layer.cornerRadius = beverage.frame.height / 4
        }
    }
}


extension VendingMachineViewController {
    
    private func beveragesStockCount() {
        let allMenuList = vendingMachine.menuList()
        for idx in 0..<allMenuList.count {
            stockInfo[idx].text = "\(vendingMachine.stockOf(beverage: allMenuList[idx]))개"
        }
    }
    
    @IBAction func buttonForChocolateMilkStock(_ sender: Any) {
        vendingMachine.addBeverage(beverage: factory.chocoMilk)
    }
    
    
    @IBAction func buttonForStrawBerryMilkStock(_ sender: Any) {
        vendingMachine.addBeverage(beverage: factory.strawberryMilk)
    }

    
    @IBAction func buttonForCokeStock(_ sender: Any) {
        vendingMachine.addBeverage(beverage: factory.coke)
    }
    
    
    @IBAction func buttonForSpriteStock(_ sender: Any) {
        vendingMachine.addBeverage(beverage: factory.sprite)
    }
    
    @IBAction func buttonForTOPStock(_ sender: Any) {
        vendingMachine.addBeverage(beverage: factory.top)
    }
    
    @IBAction func buttonForCantataStock(_ sender: Any) {
        vendingMachine.addBeverage(beverage: factory.cantata)
    }
    
    private func balanceInfoLabel() {
        let balance = vendingMachine.insertedMoney
        stockInfo[6].text = "잔액:\(String(describing: balance))"
    }
    
    @IBAction func button1000ForBalance(_ sender: Any) {
        vendingMachine.getTheMoney(from: 1000)
    }
    
    @IBAction func button5000ForBalance(_ sender: Any) {
        vendingMachine.getTheMoney(from: 5000)
    }
    
    @IBAction func resetAllStockInfo(_ sender: Any) {
        vendingMachine.resetBeverages()
        vendingMachine.resetInsertedMoney()
    }
    
}

extension VendingMachineViewController {
    @objc private func updateInsertedMoney(notification: Notification) {
        balanceInfoLabel()
    }
    @objc private func updateBeverages(notification: Notification) {
        beveragesStockCount()
    }
    @objc private func resetInsertedMoney(notification: Notification) {
        balanceInfoLabel()
        
    }
    @objc private func resetBeveragesStock(notification: Notification) {
        beveragesStockCount()
    }
}
