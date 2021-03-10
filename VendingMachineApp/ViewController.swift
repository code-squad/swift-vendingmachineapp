//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/25.
//

import UIKit

class ViewController: UIViewController {
    
    var vendingMachine = VendingMachine()
    
    var stockStackView : StockStackView!
    var inspectorView : InspectorStackView!
    
    // TODO: VendingMachine 객체 변화에 대하여 Notification을 적용하도록 수정할 것
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(updateBeverageLabel), name: .StockCountChanged, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateCoinLabel), name: .CoinChanged, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpViews()
    }
    
    func setUpViews(){
        self.view.backgroundColor = .black
        
        let stocks = vendingMachine.getTotalStock()
        stockStackView = StockStackView(frame: .zero, stocks: stocks)
        self.view.addSubview(stockStackView)
        stockStackViewConfiguration()
        
        inspectorView = InspectorStackView()
        self.view.addSubview(inspectorView)
        inspectorViewConfiguration()
    }
}

extension ViewController {
    @objc func appendBeverageToMachine(_ sender : UIBeverageButton){
        guard let beverage = Factory.createInstance(type: sender.beverageType) else { return }
        vendingMachine.append(product: beverage)
        NotificationCenter.default.post(name: .StockCountChanged, object: nil)
    }
    @objc func appedCoinToMachine(_ sender : UICoinButton){
        vendingMachine.charge(coins: sender.coin)
        NotificationCenter.default.post(name: .CoinChanged, object: nil)
    }
}

// MARK: Notification function
extension ViewController {
    @objc func updateBeverageLabel(){
        let dict = vendingMachine.getTotalStock()
        stockStackView.setStocksCount(info: dict)
    }
    @objc func updateCoinLabel(){
        inspectorView.reloadBalanceLabelText(balance: vendingMachine.getCoins())
    }
}

// MARK: Configuration
extension ViewController {
    func stockStackViewConfiguration(){
        stockStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        stockStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stockStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -200).isActive = true
        stockStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
    func inspectorViewConfiguration(){
        inspectorView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        inspectorView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 840).isActive = true
        inspectorView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        inspectorView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
}
