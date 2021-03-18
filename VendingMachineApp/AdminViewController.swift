//
//  AdminControllerViewController.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/17.
//

import UIKit

class AdminViewController : UIViewController {

    var vendingMachine : VendingMachine!
    var stockStackView : StockStackView!
    var closeButton : UIButton = {
        let button = UIButton(type: .close)
        button.addTarget(self, action: #selector(closeButtonTouched), for: .touchDown)
        return button
    }()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateBeverageLabel), name: VendingMachine.StockCountChanged, object: vendingMachine)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        vendingMachine = (UIApplication.shared.delegate as! AppDelegate).vendingMachine
        
        let stocks = vendingMachine.getTotalStock()
        stockStackView = StockStackView(frame: .zero)
        stockStackView.itemCountPerStand = 3
        stockStackView.setUp()
        stockStackView.stockCells.forEach{ $0.buyButton.isHidden = true}
        stockStackView.setStocksCount(info: stocks)
        
        self.view.addSubview(stockStackView)
        stockStackViewConfiguration()
        self.view.addSubview(closeButton)
        closeButton.frame = CGRect(x: view.bounds.maxX - 40, y: view.bounds.minY + 20, width: 20, height: 20)
    }
}

// MARK: - Action
extension AdminViewController {
    @objc func appendBeverageToMachine(_ sender : UIBeverageButton){
        guard let beverage = Factory.createInstance(type: sender.beverageType) else { return }
        vendingMachine.append(product: beverage)
    }
    @objc func updateBeverageLabel(){
        let dict = vendingMachine.getTotalStock()
        stockStackView.setStocksCount(info: dict)
    }
    @objc func closeButtonTouched(){
        self.dismiss(animated: true)
    }
}

// MARK: - Configuration
extension AdminViewController {
    func stockStackViewConfiguration(){
        stockStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 60).isActive = true
        stockStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor,constant: 10).isActive = true
        stockStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: -10).isActive = true
        stockStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
}
