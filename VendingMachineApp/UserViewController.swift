//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/25.
//

import UIKit

class UserViewController: UIViewController {

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
        vendingMachine = (UIApplication.shared.delegate as! AppDelegate).vendingMachine
        
        setUpViews()
    }
}
// MARK: - Set Up View
extension UserViewController {
    
    func setUpViews(){
        self.view.backgroundColor = .black
        
        // 음료수의 재고를 보여주는 뷰 초기화
        setUpStockStacView()
        self.view.addSubview(stockStackView)
        stockStackViewConfiguration()
        
        // 돈을 추가하는 버튼과 잔액에 대한 뷰 초기화
        setUpInspectorView()
        self.view.addSubview(inspectorView)
        inspectorViewConfiguration()

        // 구매이력을 보여주는 뷰 초기화
        purchaseView = PurchaseScrollView()
        self.view.addSubview(purchaseView)
        purchaseViewCofiguration()
    }
    func setUpStockStacView(){
        let stocks = vendingMachine.getTotalStock()
        stockStackView = StockStackView(frame: .zero)
        stockStackView.setStocksCount(info: stocks)
        stockStackView.setUp()
        
        // 버튼을 초기화하고, action을 넣어준다.
        stockStackView.stockCells.forEach{ (oneStock) in
            oneStock.setButton(for: .buy)
            oneStock.button.bind(action: UIAction(handler:  { (action) in
                guard let item = self.vendingMachine.getProduct(with: oneStock.beverageType) else { return }
                if self.vendingMachine.availableWithCurrentCoin(to: item){
                    _ = self.vendingMachine.purchase(with: item)
                }
            }))
            
        }
    }
    func setUpInspectorView(){
        inspectorView = InspectorStackView()
        // 돈을 추가하는 버튼에 대한 action을 넣어준다.
        inspectorView.coinButtions.forEach{ (button) in
            button.bind(handler: UIAction(handler: { (action) in
                self.vendingMachine.charge(coins: button.value.rawValue)
            }))
        }
        inspectorView.reloadBalanceLabelText(balance: vendingMachine.getCoins())
    }
}

// MARK: - Notification function
extension UserViewController {
    
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
extension UserViewController {
    
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
