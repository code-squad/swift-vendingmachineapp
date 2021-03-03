import UIKit

class VendingMachineViewController: UIViewController {
    
    private var machine = VendingMachine()
    
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
        let stockOfBeverages = machine.beverages.countOfBeverages()
        var (chocoMilke, strawberryMilk) = (0, 0)
        var (coke, sprite) = (0, 0)
        var (top, cantata) = (0, 0)
        
        for beverage in stockOfBeverages {
            if beverage.key == "초코에몽" { chocoMilke += beverage.value }
            else if beverage.key == "딸기꿀단지" { strawberryMilk += beverage.value }
            else if beverage.key == "코카콜라제로" { coke += beverage.value }
            else if beverage.key == "스프라이트" { sprite += beverage.value }
            else if beverage.key == "TOP" { top += beverage.value }
            else if beverage.key == "칸타타" { cantata += beverage.value }
        }
        
        stockInfoOfChocolateMilk.text = "\(chocoMilke)개"
        stockInfoOfStrawBerryMilk.text = "\(strawberryMilk)개"
        stockInfoOfCokeZero.text = "\(coke)개"
        stockInfoOfSprite.text = "\(sprite)개"
        stockInfoOfTOP.text = "\(top)개"
        stockInfoOfCantata.text = "\(cantata)개"
    }
    
    @IBAction func buttonForChocolateMilkStock(_ sender: Any) {
        machine.addBeverage(beverage: Beverage(brand: .namyang, volume: 200, price: 1000, productName: "초코에몽", manufacturedDay: Date(), sellByDate: Date(), calories: 100, temparature: 0))
        beveragesStockCount()
    }
    
    
    @IBAction func buttonForStrawBerryMilkStock(_ sender: Any) {
        machine.addBeverage(beverage: Beverage(brand: .seoul, volume: 180, price: 900, productName: "딸기꿀단지", manufacturedDay: Date(), sellByDate: Date(), calories: 110, temparature: 0))
        beveragesStockCount()
    }

    
    @IBAction func buttonForCokeStock(_ sender: Any) {
        machine.addBeverage(beverage: Beverage(brand: .coca, volume: 200, price: 1000, productName: "코카콜라제로", manufacturedDay: Date(), sellByDate: Date(), calories: 0, temparature: 0))
        beveragesStockCount()
    }
    
    
    @IBAction func buttonForSpriteStock(_ sender: Any) {
        machine.addBeverage(beverage: Beverage(brand: .coca, volume: 250, price: 1200, productName: "스프라이트", manufacturedDay: Date(), sellByDate: Date(), calories: 100, temparature: 0))
        beveragesStockCount()
    }
    
    @IBAction func buttonForTOPStock(_ sender: Any) {
        machine.addBeverage(beverage: Beverage(brand: .maxim, volume: 100, price: 1500, productName: "TOP", manufacturedDay: Date(), sellByDate: Date(), calories: 200, temparature: 100))
        beveragesStockCount()
    }
    
    @IBAction func buttonForCantataStock(_ sender: Any) {
        machine.addBeverage(beverage: Beverage(brand: .lotte, volume: 150, price: 1300, productName: "칸타타", manufacturedDay: Date(), sellByDate: Date(), calories: 20, temparature: 100))
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
