//
//  ManagerViewController.swift
//  VendingMachineApp
//
//  Created by Eunjin Kim on 2018. 3. 26..
//  Copyright © 2018년 Eunjin Kim. All rights reserved.
//

import UIKit

class ManagerViewController: UIViewController, PieDrawable {
    var vendingMachine: Vending?
    typealias TypeOf = InventoryBox.InventoryMenu

    @IBOutlet weak var pieChartView: PieGraphView!
    @IBOutlet var countOfMenu: [UILabel]!
    @IBOutlet var addNumberOfMenu: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeInventoryBox()
        registerObserver()
        drawPieGraph()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pieChartView.setNeedsDisplay()
    }
    
    func registerObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(changeInventoryBox),
                                               name: Notification.Name.DidResetInventoryBox,
                                               object: nil)
    }
    
    func drawPieGraph() {
        pieChartView.pieDrawable = self
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
                guard let beverageName = self.vendingMachine?.choiceBeverageData(menuType: type) else {
                    return
                }
                self.vendingMachine?.addInInventory(beverageName: beverageName, number: numberOf)
            }
        }
        alert.addAction(cancel)
        alert.addAction(ok)
        alert.addTextField(configurationHandler: {(text) in
            text.placeholder = "갯수입력"
        })
        self.present(alert, animated: true)
    }
    
    func sendData() -> [String: Int] {
        guard let vendingMachine = vendingMachine else { return [:] }
        let data = vendingMachine.showPurchaseProductHistory()
        var beverage = [String: Int]()
        let listOfBeveragePurchases = data.map({$0.purchaseBeverage}) //[Beverage]
        var name: String
        
        for _ in data {
            name = String(describing: listOfBeveragePurchases)
            if !beverage.keys.contains(name) {
                beverage[name] = 0
            }
            beverage[name]! += 1
        }
        return beverage
    }
    
    @objc func changeInventoryBox() {
        guard let vendingMachine = vendingMachine else { return }
        for (index, menu) in TypeOf.kind.enumerated() {
            countOfMenu[index].text = String(describing: vendingMachine.beverageNumberOf(menuType: menu))
        }
    }
    
    @IBAction func addBeverage(sender: UIButton) {
        var type = TypeOf.otherBeverage
        for button in addNumberOfMenu where button.tag == sender.tag {
            guard let choice = vendingMachine?.typeSelector(tag: button.tag) else {
                return
            }
            type = choice
        }
        alertCountOfBeverage(type: type)
    }
    
    @IBAction func removeAllBeverage(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: "vendingMachine")
    }

    @IBAction func closeManagerView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
