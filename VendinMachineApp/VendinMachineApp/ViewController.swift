

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var vendingMachine = VendingMachine()
        vendingMachine.addBeverage(BananaMilk("빙그레", 200, 1000, "바나나우유", Date()))
        vendingMachine.addBeverage(BananaMilk("빙그레", 200, 1000, "바나나우유", Date()))
        vendingMachine.addBeverage(Coke("코카콜라", 500, 1500, "코카콜라", Date()))
        vendingMachine.addBeverage(TOP("맥심", 300, 2000, "TOP 스위트 아메리카노", Date()))
        
        vendingMachine.checkStock()
    }


}

