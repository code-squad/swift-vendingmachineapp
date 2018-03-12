//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Eunjin Kim on 2018. 3. 8..
//  Copyright © 2018년 Eunjin Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var countOfEachBeverage = [Int](repeating: 0, count: 9)
    var totalAmount = 0
    var vendingMachine = VendingMachine()
    var inventoryBox = InventoryBox()
    typealias TypeOf = InventoryBox.InventoryMenu

    @IBOutlet var countOfMenu: [UILabel]!
    @IBOutlet var imageOfMenu: [UIImageView]!
    @IBOutlet weak var balance: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        
//        let strawberryMilk: Beverage = StrawberryMilk(brand: "서울우유", weight: 200, price: 1000,
//                        name: "딸기우유", manufactureDate: formatter.date(from: "20171009") ?? Date(),
//                        strawberrySyrup: 5)
//        let bananaMilk: Beverage = BananaMilk(brand: "서울우유", weight: 200, price: 1000, name: "바나나우유",
//                                    manufactureDate: formatter.date(from: "20171012") ?? Date(), bananaSyrup: 3)
//        let coke: Beverage = Coke(brand: "팹시", weight: 350, price: 2000, name: "팹시콜라",
//                        manufactureDate: formatter.date(from: "20171005") ?? Date(), calorie: 25)
//
//        vendingMachine.addInInventory(beverageName: strawberryMilk, number: 2)
//        vendingMachine.addInInventory(beverageName: bananaMilk, number: 1)
//        vendingMachine.addInInventory(beverageName: coke, number: 3)
//
//        for menu in vendingMachine.showEntireInventory() {
//            let beverage = menu.value
//            guard let beverageName = beverage.first?.name else {
//                return
//            }
//            print("\(beverageName)(\(beverage.count)개)", terminator: " ")
//        }
//        print("")
//
        for index in 0..<9 {
            imageOfMenu[index].layer.cornerRadius = imageOfMenu[index].frame.width/4
            imageOfMenu[index].clipsToBounds = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func alertCountOfBeverage(type: TypeOf) {
        let title = "추가"
        let message = "추가 할 재고 갯수를 입력하세요."
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let ok = UIAlertAction(title: "확인", style: .default) {(_) in
            if let inputValue = alert.textFields?[0] {
                guard let numberOf = Int(inputValue.text ?? "0") else {
                    return
                }
                let beverageName = self.vendingMachine.choiceBeverageData(menuType: type)
                self.vendingMachine.addInInventory(beverageName: beverageName, number: numberOf)
                self.updateCountOfEachBeverage(vendingMachine: self.vendingMachine)
            }
        }
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addTextField(configurationHandler: {(text) in
            text.placeholder = "갯수입력"
        })
        self.present(alert, animated: true)
        
    }
    
    func updateCountOfEachBeverage(vendingMachine: VendingMachine) {
        for (index, menu) in TypeOf.kind.enumerated() {
            countOfMenu[index].text = String(vendingMachine.beverageNumberOf(menuType: menu))
        }
    }
    
    @IBAction func addBalance1(sender: UIButton) {
        totalAmount += 1000
        balance.text = String(totalAmount)
    }
    
    @IBAction func addBalance2(_ sender: UIButton) {
        totalAmount += 5000
        balance.text = String(totalAmount)
    }
    
    @IBAction func addMenu1(_ sender: Any) {
        alertCountOfBeverage(type: TypeOf.strawberryMilk)
    }

    @IBAction func addMenu2(_ sender: Any) {
        alertCountOfBeverage(type: TypeOf.bananaMilk)
    }
    
    @IBAction func addMenu3(_ sender: Any) {
        alertCountOfBeverage(type: TypeOf.chocoMilk)
    }
    
    @IBAction func addMenu4(_ sender: Any) {
        alertCountOfBeverage(type: TypeOf.sprite)
    }
    
    @IBAction func addMenu5(_ sender: Any) {
        alertCountOfBeverage(type: TypeOf.coke)
    }
    
    @IBAction func addMenu6(_ sender: Any) {
        alertCountOfBeverage(type: TypeOf.fanta)
    }
    
    @IBAction func addMenu7(_ sender: Any) {
        alertCountOfBeverage(type: TypeOf.georgia)
    }
    
    @IBAction func addMenu8(_ sender: Any) {
        alertCountOfBeverage(type: TypeOf.top)
    }
    
    @IBAction func addMenu9(_ sender: Any) {
        alertCountOfBeverage(type: TypeOf.kantanta)
    }
    
}
