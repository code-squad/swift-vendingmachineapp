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
    private var vendingMachine: VendingMachine!
    private var eachButtonType: Dictionary<UIButton, Drink.Type>!
    private var drinkOrder = DrinkOrder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.vendingMachine = appDelegate.vendingMachine

        selectPanelStackView.delegate = self
        topPanelView.delegate = self
        selectPanelStackView.setDrinkImageViewsRadius(of: 10)
        loadLeftCoinsLabel()
        loadSelectPanelStackViewLabels()
    }
    
    func didAddedDrink(typeOf drinkType: Drink.Type) {
        guard let drink = DrinkFactory.makeDrink(of: drinkType) else { return }
        vendingMachine.addDrink(drink)
        loadSelectPanelStackViewLabels()
    }
    
    func didInsertedCoin(amound: Int) {
        vendingMachine.insertCoin(amound)
        loadLeftCoinsLabel()
    }
}

extension ViewController {
    private func loadLeftCoinsLabel() {
        let leftCoin = vendingMachine.leftCoin()
        topPanelView.leftCoinsLabel.text = "\(leftCoin)원"
    }
    
    private func loadSelectPanelStackViewLabels() {
        let stock = vendingMachine.showStock()
        for index in 0..<selectPanelStackView.addDrinkButtons.count {
            let key = ObjectIdentifier(drinkOrder[index])
            if stock[key] != nil {
                selectPanelStackView.stockDrinkLabels[index].text = "\(stock[key]!.count)개"
            } else {
                selectPanelStackView.stockDrinkLabels[index].text = "0개"
            }
        }
    }
}
