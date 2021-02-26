

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var vendingMachine = VendingMachine()
        vendingMachine.addBeverage(BananaMilk(brand: "빙그레", size: 200, price: 1000, name: "바나나우유", manufactureDate: Date()))
        vendingMachine.addBeverage(BananaMilk(brand: "빙그레", size: 200, price: 1000, name: "바나나우유", manufactureDate: Date()))
        vendingMachine.addBeverage(Coke(brand: "코카콜라", size: 500, price: 1500, name: "코카콜라", manufactureDate: Date()))
        vendingMachine.addBeverage(TOP(brand: "맥심", size: 300, price: 2000, name: "TOP 스위트 아메리카노", manufactureDate: Date()))
        
        vendingMachine.checkStock()
    }


}

