import UIKit

class VendingMachineViewController: UIViewController {
    
    private var machine = VendingMachine()
    
    @IBOutlet weak var stockInfoOfChocolateMilk: UILabel!
    @IBOutlet weak var stockInfoOfStrawBerryMilk: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        beverageStockCountView()
    }
    
    private func beverageStockCountView() {
        chocolateMilkeStockCount()
        strawBerryMilkeStockCount()
    }
    

    
}


extension VendingMachineViewController {
    
    private func chocolateMilkeStockCount() {
        let stockOfBeverages = machine.beverages.countOfBeverages()
        var stockCount = 0
        for beverage in stockOfBeverages {
            if beverage.key == "초코에몽" {
                stockCount += beverage.value
            }
        }
        stockInfoOfChocolateMilk.text = "\(stockCount)개"
    }
    
    @IBAction func buttonForChocolateMilkStock(_ sender: Any) {
        machine.addBeverage(beverage: Beverage(brand: .namyang, volume: 200, price: 1000, productName: "초코에몽", manufacturedDay: Date(), sellByDate: Date(), calories: 100, temparatureOfBeverage: 0))
        chocolateMilkeStockCount()
    }
    
    private func strawBerryMilkeStockCount() {
        let stockOfBeverages = machine.beverages.countOfBeverages()
        var stockCount = 0
        for beverage in stockOfBeverages {
            if beverage.key == "딸기꿀단지" {
                stockCount += beverage.value
            }
        }
        stockInfoOfStrawBerryMilk.text = "\(stockCount)개"
    }
    
    @IBAction func buttonForStrawBerryMilkStock(_ sender: Any) {
        machine.addBeverage(beverage: Beverage(brand: .seoul, volume: 180, price: 900, productName: "딸기꿀단지", manufacturedDay: Date(), sellByDate: Date(), calories: 110, temparatureOfBeverage: 0))
        strawBerryMilkeStockCount()
    }
    
}
