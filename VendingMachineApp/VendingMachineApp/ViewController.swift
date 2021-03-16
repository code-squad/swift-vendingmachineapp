//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var productStackView: UIStackView!
    @IBOutlet weak var productSample: ProductStackView!
    
    @IBOutlet var countLabelCollection: [UILabel]!
    @IBOutlet var stockButtonCollection: [UIButton]!
    @IBOutlet var moneyButtonCollection: [UIButton]!
    @IBOutlet var buyButtonCollection: [UIButton]!
    
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var dispensedListScrollView: UIScrollView!
    
    private let beverageImages = [#imageLiteral(resourceName: "americano"), #imageLiteral(resourceName: "cafelatte"), #imageLiteral(resourceName: "chocolatemilk"), #imageLiteral(resourceName: "coke"), #imageLiteral(resourceName: "milkis"), #imageLiteral(resourceName: "plainmilk")]
    private let moneyUnits = [1000, 5000, 10000]
    
    private let itemTypes: [Shopable.Type] = [Americano.self, CafeLatte.self, Chocolate.self, Coke.self, Milkis.self, Plain.self]

    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var presenter: VendingMachineViewPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = VendingMachineViewUpdator(userInterface: appDelegate.vendingMachine,
                                              workerInterface: appDelegate.vendingMachine)
        
        presenter.initialScreen(images: beverageImages,
                            sampleView: productSample,
                            stackView: productStackView,
                            moneyLabel: moneyLabel)
        
        updateOutletCollections()
        
        presenter.updateStocks(countLabels: countLabelCollection,
                               typeList: itemTypes)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didStockListChanged(_:)),
                                               name: VendingMachine.NotiKeys.stockListUpdate,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didBalanceChanged(_:)),
                                               name: VendingMachine.NotiKeys.balanceUpdate,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didBoughtItem(_:)),
                                               name: VendingMachine.NotiKeys.dispensdListUpdate,
                                               object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter.updateDispensedList(scrollView: dispensedListScrollView,
                                      images: beverageImages,
                                      typeList: itemTypes)
    }
    
    private func updateOutletCollections() {
        countLabelCollection = []
        stockButtonCollection = []
        buyButtonCollection = []
        
        for view in productStackView.arrangedSubviews {
            let stackView = view as! ProductStackView
            countLabelCollection.append(stackView.countLabel)
            stockButtonCollection.append(stackView.addButton)
            buyButtonCollection.append(stackView.buyButton)
            stackView.addButton.addTarget(self, action: #selector(self.addStockTouched(_:)), for: .touchUpInside)
            stackView.buyButton.addTarget(self, action: #selector(self.buyItemTouched(_:)), for: .touchUpInside)
        }
    }
    
    @objc func didStockListChanged(_ notification: Notification) {
        presenter.updateStocks(countLabels: countLabelCollection,
                               typeList: itemTypes)
    }
    
    @objc func didBalanceChanged(_ notification: Notification) {
        presenter.updateBalance(label: moneyLabel)
    }
    
    @objc func didBoughtItem(_ notification: Notification) {
        presenter.updateDispensedList(scrollView: dispensedListScrollView,
                                      images: beverageImages,
                                      typeList: itemTypes)
    }
    
    @IBAction func addStockTouched(_ sender: UIButton) {
        if let targetIdx = stockButtonCollection.firstIndex(of: sender) {
            let targetBeverage = itemTypes[targetIdx]
            appDelegate.vendingMachine.addStock(of: targetBeverage)
        }
    }
    
    @IBAction func addMoneyTouched(_ sender: UIButton) {
        if let targetIdx = moneyButtonCollection.firstIndex(of: sender) {
            let amount = moneyUnits[targetIdx]
            appDelegate.vendingMachine.insert(money: amount)
        }
    }
    
    @IBAction func buyItemTouched(_ sender: UIButton) {
        if let targetIdx = buyButtonCollection.firstIndex(of: sender) {
            let targetBeverage = itemTypes[targetIdx]
            appDelegate.vendingMachine.buy(itemType: targetBeverage)
        }
    }
}
