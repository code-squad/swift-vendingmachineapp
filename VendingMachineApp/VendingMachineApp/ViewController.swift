//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Issac on 2021/02/24.
//

import UIKit
import Combine

class ViewController: UIViewController {
    @IBOutlet weak var purchaseHistoryScrollView: PurchaseHistoryScrollView!
    @IBOutlet weak var selectPanelStackView: SelectPanelStackView!
    @IBOutlet weak var topPanelView: TopPanel!
    
    private var coinCounterSubscriber: AnyCancellable!
    private var puchaseHistorySubscriber: AnyCancellable!
    private var vendingMachine: VendingMachine!
    private var drinkOrder = DrinkOrder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.vendingMachine = VendingMachine.default
        selectPanelStackView.delegate = self
        topPanelView.delegate = self
        loadSelectPanelStackViewLabels()
        configObserver()
        topPanelView.roundCorners(corners: [.topLeft, .bottomLeft], radius: 30)
        selectPanelStackView.setDrinkImageViewsRadius(of: 10)
    }
    
    func configObserver() {
        configCoinsLabelObserver()
        configStockLabelObserver()
        configPurchaseHistoryObserver()
    }
}

extension ViewController {
    private func configPurchaseHistoryObserver() {
        puchaseHistorySubscriber = vendingMachine.purchaseHistoryPublisher
            .sink { (drinks) in
                self.loadLastPurchasehistory(history: drinks)
            }
    }
    
    private func configStockLabelObserver() {
        NotificationCenter.default
            .addObserver(self,
                         selector: #selector(noticedLoadSelectPanelStackViewLabels(_:)),
                         name: Stock.Notification.DidChangeStock,
                         object: vendingMachine.stock)
    }
    
    private func configCoinsLabelObserver() {
        coinCounterSubscriber = vendingMachine.coinPublisher
            .map { (coins) -> String in
                return "\(coins)원"
            }.assign(to: \.text, on: topPanelView.leftCoinsLabel)
    }
    
    private func loadLastPurchasehistory(history drinks: [Drink]) {
        guard let drink = drinks.last else { return }
        guard let imageView = self.makeImageView(named: drink.name) else { return }
        self.purchaseHistoryScrollView.purchaseHistoryStackView.addArrangedSubview(imageView)
        self.resizingHistoryImage(imageView)
    }
    
    private func loadPurchasehistory() {
        vendingMachine.checkPurchasehistory { (drink) in
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
    
    func loadSelectPanelStackViewLabels() {
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
    
    @objc func noticedLoadSelectPanelStackViewLabels(_ notification: Notification) {
        loadSelectPanelStackViewLabels()
    }
}

extension ViewController: SelectPanelStackViewDelegate {
    func didAddedDrink(typeOf drinkType: Drink.Type) {
        guard let drink = DrinkFactory.makeDrink(of: drinkType) else { return }
        vendingMachine.addDrink(drink)
    }
    
    func didBoughtDrink(typeOf drinkType: Drink.Type) {
        _ = vendingMachine.buy(typeOf: drinkType)
    }
    
}
extension ViewController: TopPanelDelegate {
    func didInsertedCoin(amound: Int) {
        vendingMachine.insertCoin(amound)
    }
}

