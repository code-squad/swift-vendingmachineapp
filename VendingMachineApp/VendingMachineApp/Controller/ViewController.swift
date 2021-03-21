//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 오킹 on 2021/02/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inventoryStackView: UIStackView!
    @IBOutlet weak var purchasedBeverageScrollView: PurchasedItemListScrollView!
    @IBOutlet weak var moneyLabel: UILabel!
    
    //TODO:- VendingMachine타입이 아니라 프로토콜로 수정
    var vendingMachine: VendingMachine!
    
    private lazy var vendingMachineInfo = VendingMachineInfo(with: vendingMachine)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpInventoryStackView()
        setUpPurchasedBeverageScrollView()
        
        //TODO:- name을 VendingMachine Class에 enum타입으로 추가
        NotificationCenter.default.addObserver(self, selector: #selector(updateBeverageStockLabel), name: NSNotification.Name("addedBeverage"), object: vendingMachine)
        NotificationCenter.default.addObserver(self, selector: #selector(updateMoneyLabel), name: NSNotification.Name("addMoney"), object: vendingMachine)
        NotificationCenter.default.addObserver(self, selector: #selector(updateBeverageStockLabel), name: NSNotification.Name("buyBeverage"), object: vendingMachine)
        NotificationCenter.default.addObserver(self, selector: #selector(updateMoneyLabel), name: NSNotification.Name("buyBeverage"), object: vendingMachine)
        NotificationCenter.default.addObserver(self, selector: #selector(addPurchasedBeverageView), name: NSNotification.Name("buyBeverage"), object: vendingMachine)
    }
    
    private func setUpInventoryStackView() {
        vendingMachineInfo.repeatForBeverageView { beverageView in
            inventoryStackView.addArrangedSubview(beverageView)
        }
    }
    
    private func setUpPurchasedBeverageScrollView() {
        vendingMachine.showPurchaseHistory().forEach { beverage in
            let beverageImage = vendingMachineInfo.matchModelAndViewHelper[ObjectIdentifier(type(of: beverage))]?.imageView.image
            purchasedBeverageScrollView.addImageView(image: beverageImage ?? UIImage())
        }
    }
    
    @objc
    private func addPurchasedBeverageView(notification: Notification) {
        guard let imageName = notification.userInfo as? [String : String],
              let imageSource = imageName["imageName"],
              let image = UIImage(named: imageSource) else {
            return
        }
        
        purchasedBeverageScrollView.addImageView(image: image)
    }
    
    @objc
    private func updateMoneyLabel(notification: Notification) {
        let vendingMachine = notification.object as! VendingMachine
      
        moneyLabel.text = "잔액: \(vendingMachine.showCurrentMoney()) 원"
    }
    
    //BeverageView - addButton의 First Responder로 설정
    @IBAction
    func addBeverage(_ sender: UIButton) {
        
        guard let beverageType = vendingMachineInfo.beverageTypeAddButtons[sender] else {
            return
        }

        vendingMachine.appendInventory(beverageType.init())
    }
    
    //BeverageView - buyButton의 First Responder로 설정
    @IBAction
    func buyBeverage(_ sender: UIButton) {
        
        guard let beverageType = vendingMachineInfo.beverageTypeBuyButtons[sender] else {
            return
        }

        vendingMachine.buy(beverageType)
    }
    
    @objc
    private func updateBeverageStockLabel(notification: Notification) {

        let vendingMachine = notification.object as! VendingMachine
       
        vendingMachineInfo.matchModelAndViewHelper.forEach { (arg0) in
            
            let (objectIdentifier, beverageView) = arg0
            beverageView.stockLabel.text = "\(vendingMachine.showAllBeverageList()[objectIdentifier]?.count ?? 0)"
        }
    }
    
    //TODO:- sender를 이용하여 잔액 추가하도록 수정
    @IBAction func addMoney5000(_ sender: Any) {
        vendingMachine.put(in: .fiveThousand)
    }
    
    @IBAction func addMoney1000(_ sender: Any) {
        vendingMachine.put(in: .thousand)
    }
}
