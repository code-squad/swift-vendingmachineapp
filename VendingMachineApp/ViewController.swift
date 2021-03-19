//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/25.
//

import UIKit

class ViewController: UIViewController {

    var stockStackView : StockStackView!
    var inspectorView : InspectorStackView!
    var purchaseView : PurchaseScrollView!
    
    var vendingMachine : UserOfVendingMachine!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNotificationCenter()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        setUpViews()
    }
    
    func setUpViews(){
        self.view.backgroundColor = .black
        
        vendingMachine = (UIApplication.shared.delegate as! AppDelegate).vendingMachine
        
        let stocks = vendingMachine.getTotalStock()
        stockStackView = StockStackView(frame: .zero)
        stockStackView.setStocksCount(info: stocks)
        stockStackView.setUp()
        stockStackView.stockCells.forEach{ $0.addButton.isHidden = true}
        stockStackView.stockCells.forEach{ (oneStock) in
            oneStock.buyButton.bind(action: UIAction(handler:  { (action) in
                guard let item = self.vendingMachine.getProduct(with: oneStock.beverageType) else { return }
                if self.vendingMachine.availableWithCurrentCoin(to: item){
                    _ = self.vendingMachine.purchase(with: item)
                }
            }))
            
        }
        self.view.addSubview(stockStackView)
        stockStackViewConfiguration()
        
        inspectorView = InspectorStackView()
        inspectorView.reloadBalanceLabelText(balance: vendingMachine.getCoins())
        self.view.addSubview(inspectorView)
        inspectorViewConfiguration()

        purchaseView = PurchaseScrollView()
        self.view.addSubview(purchaseView)
        purchaseViewCofiguration()
    }
}

// MARK: - Actions
extension ViewController {
    
    @objc func appedCoinToMachine(_ sender : UICoinButton){
        vendingMachine.charge(coins: sender.coin)
    }
}

// MARK: - Notification function
extension ViewController {
    
    func setNotificationCenter(){
        NotificationCenter.default.addObserver(self, selector: #selector(updateBeverageLabel), name: VendingMachine.StockCountChanged, object: vendingMachine)
        NotificationCenter.default.addObserver(self, selector: #selector(updateCoinLabel), name: VendingMachine.CoinChanged, object: vendingMachine)
        NotificationCenter.default.addObserver(self, selector: #selector(updatePurchaseList), name: VendingMachine.SoldHistoryChanged, object: vendingMachine)
    }
    @objc func updateBeverageLabel(){
        let dict = vendingMachine.getTotalStock()
        stockStackView.setStocksCount(info: dict)
    }
    @objc func updateCoinLabel(){
        inspectorView.reloadBalanceLabelText(balance: vendingMachine.getCoins())
    }
    @objc func updatePurchaseList(){
        let element = vendingMachine.getSoldProducts().last!
        let image = ImageManager.getImage(type: type(of: element))
        purchaseView.addSubView(with: image)
    }
}

// MARK: - Configuration
extension ViewController {
    
    func stockStackViewConfiguration(){
        stockStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        stockStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stockStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -200).isActive = true
        stockStackView.heightAnchor.constraint(equalToConstant: 520).isActive = true
    }
    func inspectorViewConfiguration(){
        inspectorView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        inspectorView.leadingAnchor.constraint(equalTo: self.stockStackView.trailingAnchor, constant: 10).isActive = true
        inspectorView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        inspectorView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -300).isActive = true
    }
    func purchaseViewCofiguration(){
        purchaseView.topAnchor.constraint(equalTo: self.stockStackView.bottomAnchor, constant: 10).isActive = true
        purchaseView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        purchaseView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -200).isActive = true
        purchaseView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
}
