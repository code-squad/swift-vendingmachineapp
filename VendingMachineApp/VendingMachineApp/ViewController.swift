//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/24.
//

import UIKit
import Combine

class ViewController: UIViewController, SelectPanelStackViewDelegate, TopPanelDelegate {
    @IBOutlet weak var purchaseHistoryScrollView: UIScrollView!
    @IBOutlet weak var selectPanelStackView: SelectPanelStackView!
    @IBOutlet weak var topPanelView: TopPanel!
    
    private var stockPublisher: AnyCancellable!
    private var coinCounterPublisher: AnyCancellable!
    private var vendingMachine: VendingMachine!
    private var drinkOrder = DrinkOrder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.vendingMachine = VendingMachine.default
        selectPanelStackView.delegate = self
        topPanelView.delegate = self
        
        loadLeftCoinsLabel()
        loadSelectPanelStackViewLabels()
        configCoinsLabelObserver()
        configStockLabelObserver()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        topPanelView.roundCorners(corners: [.topLeft, .bottomLeft], radius: 30)
        selectPanelStackView.setDrinkImageViewsRadius(of: 10)
    }
    
    public func settingVendingMachine(_ vendingMachine: VendingMachine) {
        self.vendingMachine = vendingMachine
    }
    
    func configStockLabelObserver() {
        stockPublisher = NotificationCenter.default
            .publisher(for: Stock.Notification.DidChangeStock)
            .sink(receiveValue: { (notification) in
                DispatchQueue.main.async {
                    self.loadSelectPanelStackViewLabels()
                }
            })
    }
    
    func configCoinsLabelObserver() {
        coinCounterPublisher = NotificationCenter.default
            .publisher(for: CoinCounter.Notification.DidChangeCoin)
            .sink(receiveValue: { (notification) in
                DispatchQueue.main.async {
                    self.loadLeftCoinsLabel()
                }
            })
    }
    
    func didAddedDrink(typeOf drinkType: Drink.Type) {
        guard let drink = DrinkFactory.makeDrink(of: drinkType) else { return }
        vendingMachine.addDrink(drink)
    }
    
    func didInsertedCoin(amound: Int) {
        vendingMachine.insertCoin(amound)
    }
}

extension ViewController {
    @objc private func loadLeftCoinsLabel() {
        let leftCoin = vendingMachine.leftCoin()
        topPanelView.leftCoinsLabel.text = "\(leftCoin)원"
    }
    
    @objc private func loadSelectPanelStackViewLabels() {
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
