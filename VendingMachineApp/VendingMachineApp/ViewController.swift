//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import UIKit

class ViewController: UIViewController {
    private var vendingMachine = VendingMachine()
    
    @IBOutlet var addStockButton: [BeveragesButton]!
    @IBOutlet var beverageImages: [BeverageImageView]!
    @IBOutlet var numberOfStock: [UILabel]!
    @IBOutlet weak var BalanceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buyBeverageButtonTouched(_ sender: BeveragesButton) {
        //vendingMachine.addStock(beverage: testconvert.abc(ab: sender.increase())!)
        //guard let beverage = testconvert.abc(ab: sender.increase()) else { return }
        sender.increase(action: { (beverage) in
            self.vendingMachine.addStock(beverage: beverage)
            self.numberOfStock[sender.tag].text = String(self.vendingMachine.countDrink(beverage: beverage))
        })
    }
    
    @IBAction func BalanceIncreaseButtonTouched(_ sender: BalanceIncreasable) {
        sender.increase { money in
            self.vendingMachine.putPayMoney(money: money)
            self.changeBalanceLabel()
        }
    }
    
    private func changeBalanceLabel() {
        self.BalanceLabel.text = String(self.vendingMachine.checkCurrentBalance())
    }
}

//class testconvert {
//    var a : testable?
//    class func abc(ab : testable.Type) -> Beverage? {
//        switch ab.self {
//            case is TopAmericanoButton.Type: return TopAmericano()
//            case is DietColaButton.Type : return DietCola()
//            case is StrawberryMilkButton.Type : return StrawberryMilk()
//            default : return nil
//        }
//    }
//}
