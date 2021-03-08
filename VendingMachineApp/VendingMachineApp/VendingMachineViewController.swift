import UIKit

class VendingMachineViewController: UIViewController {
    
    let factory = BeverageFactory()
    private var vendingMachine: VendingMachine!
    
    @IBOutlet weak var stockInfoOfChocolateMilk: UILabel!
    @IBOutlet weak var stockInfoOfStrawBerryMilk: UILabel!
    @IBOutlet weak var stockInfoOfCokeZero: UILabel!
    @IBOutlet weak var stockInfoOfSprite: UILabel!
    @IBOutlet weak var stockInfoOfTOP: UILabel!
    @IBOutlet weak var stockInfoOfCantata: UILabel!
    @IBOutlet weak var balanceInfo: UILabel!
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
        stockInfoOfChocolateMilk.text = "\(chocoMilk)개"
        stockInfoOfStrawBerryMilk.text = "\(strawberryMilk)개"
        stockInfoOfCokeZero.text = "\(coke)개"
        stockInfoOfSprite.text = "\(sprite)개"
        stockInfoOfTOP.text = "\(top)개"
        stockInfoOfCantata.text = "\(cantata)개"
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
        balanceInfo.text = "잔액:\(String(describing: balance))"
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
