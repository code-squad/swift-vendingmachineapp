import UIKit

class VendingMachineViewController: UIViewController {
    
    private var machine = VendingMachine()
    let factory = BeverageFactory()
    
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
        let chocoMilke = machine.stockOf(beverage: factory.chocoMilk)
        let strawberryMilk = machine.stockOf(beverage: factory.strawberryMilk)
        let coke = machine.stockOf(beverage: factory.coke)
        let sprite = machine.stockOf(beverage: factory.sprite)
        let top = machine.stockOf(beverage: factory.top)
        let cantata = machine.stockOf(beverage: factory.cantata)
        stockInfoOfChocolateMilk.text = "\(chocoMilke)개"
        stockInfoOfStrawBerryMilk.text = "\(strawberryMilk)개"
        stockInfoOfCokeZero.text = "\(coke)개"
        stockInfoOfSprite.text = "\(sprite)개"
        stockInfoOfTOP.text = "\(top)개"
        stockInfoOfCantata.text = "\(cantata)개"
    }
    
    @IBAction func buttonForChocolateMilkStock(_ sender: Any) {
        machine.addBeverage(beverage:factory.chocoMilk)
        beveragesStockCount()
    }
    
    
    @IBAction func buttonForStrawBerryMilkStock(_ sender: Any) {
        machine.addBeverage(beverage: factory.strawberryMilk)
        beveragesStockCount()
    }

    
    @IBAction func buttonForCokeStock(_ sender: Any) {
        machine.addBeverage(beverage: factory.coke)
        beveragesStockCount()
    }
    
    
    @IBAction func buttonForSpriteStock(_ sender: Any) {
        machine.addBeverage(beverage: factory.sprite)
        beveragesStockCount()
    }
    
    @IBAction func buttonForTOPStock(_ sender: Any) {
        machine.addBeverage(beverage: factory.top)
        beveragesStockCount()
    }
    
    @IBAction func buttonForCantataStock(_ sender: Any) {
        machine.addBeverage(beverage: factory.cantata)
        beveragesStockCount()
    }
    
}

extension VendingMachineViewController {
    
    private func balanceInfoLabel() {
        let balance = machine.insertedMoney
        balanceInfo.text = "잔액:\(balance)"
    }
    
    @IBAction func button1000ForBalance(_ sender: Any) {
        machine.getTheMoney(from: 1000)
        balanceInfoLabel()
    }
    
    @IBAction func button5000ForBalance(_ sender: Any) {
        machine.getTheMoney(from: 5000)
        balanceInfoLabel()
    }
    
}
