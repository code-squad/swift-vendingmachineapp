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
    
    @IBOutlet weak var moneyLabel: UILabel!

    private let beverageImages = [#imageLiteral(resourceName: "americano"), #imageLiteral(resourceName: "cafelatte"), #imageLiteral(resourceName: "chocolatemilk"), #imageLiteral(resourceName: "coke"), #imageLiteral(resourceName: "milkis"), #imageLiteral(resourceName: "plainmilk")]
    private let moneyUnits = [1000, 5000, 10000]
    
    private var beverageList = [Shopable]()
    private let beverageFactory = BeverageToday()

    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var presenter = VendingMachineViewUpdator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beverageList = beverageFactory.createAll()
        
        presenter.initialScreen(images: beverageImages,
                            sampleView: productSample,
                            stackView: productStackView,
                            machine: appDelegate.vendingMachine,
                            moneyLabel: moneyLabel)
        
        updateOutletCollections()
        
        presenter.updateStocks(machine: appDelegate.vendingMachine,
                               countLabels: countLabelCollection,
                               beverageList: beverageList)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didStockListChanged(_:)),
                                               name: VendingMachine.NotiKeys.stockListUpdate,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didBalanceChanged(_:)),
                                               name: VendingMachine.NotiKeys.balanceUpdate,
                                               object: nil)
    }
    
    private func updateOutletCollections() {
        countLabelCollection = []
        stockButtonCollection = []
        
        for view in productStackView.arrangedSubviews {
            let stackView = view as! ProductStackView
            countLabelCollection.append(stackView.countLabel)
            stockButtonCollection.append(stackView.addButton)
            stackView.addButton.addTarget(self, action: #selector(self.addStockTouched(_:)), for: .touchUpInside)
        }
    }
    
    @objc func didStockListChanged(_ notification: Notification) {
        presenter.updateStocks(machine: appDelegate.vendingMachine,
                               countLabels: countLabelCollection,
                               beverageList: beverageList)
    }
    
    @objc func didBalanceChanged(_ notification: Notification) {
        presenter.updateBalance(machine: appDelegate.vendingMachine,
                                label: moneyLabel)
    }
    
    @IBAction func addStockTouched(_ sender: UIButton) {
        if let targetIdx = stockButtonCollection.firstIndex(of: sender) {
            let targetBeverage = beverageList[targetIdx]
            appDelegate.vendingMachine.addStock(of: targetBeverage)
        }
    }
    
    @IBAction func addMoneyTouched(_ sender: UIButton) {
        if let targetIdx = moneyButtonCollection.firstIndex(of: sender) {
            let amount = moneyUnits[targetIdx]
            appDelegate.vendingMachine.insert(money: amount)
        }
    }
}
