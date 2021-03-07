//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/24.
//

import UIKit

class ViewController: UIViewController, SelectPanelStackViewDelegate, TopPanelDelegate {
    @IBOutlet weak var selectPanelStackView: SelectPanelStackView!
    @IBOutlet weak var topPanelView: TopPanel!
    var vendingMachine: VendingMachine!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vendingMachine = VendingMachine()
        selectPanelStackView.delegate = self
        topPanelView.delegate = self
        selectPanelStackView.setDrinkImageViewsRadius(of: 5)
    }
    
    func didAddedDrink(typeOf drinkType: Drink.Type) {
        vendingMachine.addDrink(drinkType)
        loadSelectPanelStackViewLabels()
    }
    
    func didInsertedCoin(amound: Int) {
        vendingMachine.insertCoin(amound)
        loadLeftCoinsLabel()
    }
    
}

extension ViewController {
    private func findDrinkTypeToTag(of tag: Int) -> Drink.Type? {
        switch tag {
        case 0: return BlueBottleColdBrew.self
        case 1: return Fanta.self
        case 2: return BingBananaMilk.self
        case 3: return SeoulStrawberryMilk.self
        case 4: return Sanpellegrino.self
        case 5: return StarbucksColdBrew.self
        default: return nil
        }
    }
    
    private func loadLeftCoinsLabel() {
        let leftCoin = vendingMachine.leftCoin()
        topPanelView.leftCoinsLabel.text = "\(leftCoin)원"
    }
    
    private func loadSelectPanelStackViewLabels() {
        let stock = vendingMachine.showStock()
        selectPanelStackView.stockDrinkLabels.enumerated().forEach { (index, label) in
            guard let type = findDrinkTypeToTag(of: label.tag) else { return }
            let typeKey = ObjectIdentifier(type)
            if stock[typeKey] != nil {
                label.text = "\(stock[typeKey]!.count)개"
            } else {
                label.text = "0개"
            }
        }
    }
}
