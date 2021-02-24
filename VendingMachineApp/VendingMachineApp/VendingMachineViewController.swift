import UIKit

class VendingMachineViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Beverage(brand: Brand.Brand.seoul, volume: 200, price: 1000, productName: "날마다딸기우유", manufactureDate: Date()))
        print(Beverage(brand: Brand.Brand.lotte, volume: 500, price: 900, productName: "콘트라베이스 콜드브루 블랙", manufactureDate: Date(timeIntervalSinceNow: -86400 * 10)))
        print(Beverage(brand: Brand.Brand.maxim, volume: 400, price: 3000, productName: "TOP아메리카노", manufactureDate: Date(timeIntervalSinceNow: -86400 * 2)))
    }

}

