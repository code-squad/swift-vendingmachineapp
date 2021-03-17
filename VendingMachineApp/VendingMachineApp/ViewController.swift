//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/24.
//

import UIKit
import Combine

class ViewController: UIViewController, SelectPanelStackViewDelegate, TopPanelDelegate {
    @IBOutlet weak var purchaseHistoryScrollView: PurchaseHistoryScrollView!
    @IBOutlet weak var selectPanelStackView: SelectPanelStackView!
    @IBOutlet weak var topPanelView: TopPanel!
    
    private var stockPublisher: AnyCancellable!
    private var coinCounterPublisher: AnyCancellable!
    private var puchaseHistorySubscriber: AnyCancellable!
    private var vendingMachine: VendingMachine!
    private var drinkOrder = DrinkOrder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.vendingMachine = VendingMachine.default
        selectPanelStackView.delegate = self
        topPanelView.delegate = self
        
        configCoinsLabelObserver()
        configStockLabelObserver()
        configPurchaseHistoryObserver()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        loadLeftCoinsLabel()
        loadSelectPanelStackViewLabels()
        loadPurchasehistory(drinks: vendingMachine.purchaseHistory)
        topPanelView.roundCorners(corners: [.topLeft, .bottomLeft], radius: 30)
        selectPanelStackView.setDrinkImageViewsRadius(of: 10)
    }
    
    public func settingVendingMachine(_ vendingMachine: VendingMachine) {
        self.vendingMachine = vendingMachine
    }
    
    func configPurchaseHistoryObserver() {
        puchaseHistorySubscriber = vendingMachine.$purchaseHistory
            .sink { (drinks) in
                guard let drink = drinks.last else { return }
                guard let imageView = self.makeImageView(named: drink.name) else { return }
                self.purchaseHistoryScrollView.purchaseHistoryStackView.addArrangedSubview(imageView)
                self.resizingHistoryImage(imageView)
            }
    }
    
    func configStockLabelObserver() {
        stockPublisher = NotificationCenter.default
            .publisher(for: Stock.Notification.DidChangeStock)
            .sink(receiveValue: { (notification) in
                self.loadSelectPanelStackViewLabels()
            })
    }
    
    func configCoinsLabelObserver() {
        coinCounterPublisher = NotificationCenter.default
            .publisher(for: CoinCounter.Notification.DidChangeCoin)
            .sink(receiveValue: { (notification) in
                self.loadLeftCoinsLabel()
            })
    }
    
    func didAddedDrink(typeOf drinkType: Drink.Type) {
        guard let drink = DrinkFactory.makeDrink(of: drinkType) else { return }
        vendingMachine.addDrink(drink)
    }
    
    func didBoughtDrink(typeOf drinkType: Drink.Type) {
        _ = vendingMachine.buy(typeOf: drinkType)
    }
    
    func didInsertedCoin(amound: Int) {
        vendingMachine.insertCoin(amound)
    }
}

extension ViewController {
    @objc private func loadPurchasehistory(drinks: [Drink]) {
        drinks.forEach { (drink) in
            guard let imageView = makeImageView(named: drink.name) else { return }
            purchaseHistoryScrollView.purchaseHistoryStackView.addArrangedSubview(imageView)
            resizingHistoryImage(imageView)
        }
    }
    
    private func makeImageView(named: String) -> UIImageView? {
        guard let image = UIImage(named: named) else { return nil }
        return UIImageView(image: image)
    }
    
    private func resizingHistoryImage(_ imageView: UIImageView) {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
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
