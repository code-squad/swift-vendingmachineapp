import UIKit

class VendingMachineViewController: UIViewController {
    
    let factory = BeverageFactory()
    private var vendingMachine: VendingMachine!
    
    @IBOutlet var stockInfo: [UILabel]!
    @IBOutlet var imagesOfBeverages: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myDelegate = UIApplication.shared.delegate as! AppDelegate
        vendingMachine = myDelegate.machine
        beveragesStockCount()
        balanceInfoLabel()
        setUpImageView()
        view.backgroundColor = UIColor.systemGray5
    }
    
    
    private func setUpImageView() {
        for beverage in imagesOfBeverages {
            beverage.layer.cornerRadius = beverage.frame.height / 4
        }
    }
}


extension VendingMachineViewController {
    
    private func beveragesStockCount() {
        let chocoMilk = vendingMachine.stockOf(beverage: factory.chocoMilk)
        let strawberryMilk = vendingMachine.stockOf(beverage: factory.strawberryMilk)
        let coke = vendingMachine.stockOf(beverage: factory.coke)
        let sprite = vendingMachine.stockOf(beverage: factory.sprite)
        let top = vendingMachine.stockOf(beverage: factory.top)
        let cantata = vendingMachine.stockOf(beverage: factory.cantata)
        stockInfo[0].text = "\(chocoMilk)개"
        stockInfo[1].text = "\(strawberryMilk)개"
        stockInfo[2].text = "\(coke)개"
        stockInfo[3].text = "\(sprite)개"
        stockInfo[4].text = "\(top)개"
        stockInfo[5].text = "\(cantata)개"
    }
    
    @IBAction func buttonForChocolateMilkStock(_ sender: Any) {
        vendingMachine.addBeverage(beverage: factory.chocoMilk)
        beveragesStockCount()
    }
    
    
    @IBAction func buttonForStrawBerryMilkStock(_ sender: Any) {
        vendingMachine.addBeverage(beverage: factory.strawberryMilk)
        beveragesStockCount()
    }

    
    @IBAction func buttonForCokeStock(_ sender: Any) {
        vendingMachine.addBeverage(beverage: factory.coke)
        beveragesStockCount()
    }
    
    
    @IBAction func buttonForSpriteStock(_ sender: Any) {
        vendingMachine.addBeverage(beverage: factory.sprite)
        beveragesStockCount()
    }
    
    @IBAction func buttonForTOPStock(_ sender: Any) {
        vendingMachine.addBeverage(beverage: factory.top)
        beveragesStockCount()
    }
    
    @IBAction func buttonForCantataStock(_ sender: Any) {
        vendingMachine.addBeverage(beverage: factory.cantata)
        beveragesStockCount()
    }
    
    private func balanceInfoLabel() {
        let balance = vendingMachine.insertedMoney
        stockInfo[6].text = "잔액:\(String(describing: balance))"
    }
    
    @IBAction func button1000ForBalance(_ sender: Any) {
        vendingMachine.getTheMoney(from: 1000)
        balanceInfoLabel()
    }
    
    @IBAction func button5000ForBalance(_ sender: Any) {
        vendingMachine.getTheMoney(from: 5000)
        balanceInfoLabel()
    }
    
    @IBAction func resetAllStockInfo(_ sender: Any) {
        vendingMachine.insertedMoney.resetMoeny()
        vendingMachine.beverages.resetStock()
        balanceInfoLabel()
        beveragesStockCount()
    }
    
}
