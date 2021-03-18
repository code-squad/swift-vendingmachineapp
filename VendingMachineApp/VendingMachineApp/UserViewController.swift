//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import UIKit

class UserViewController: UIViewController {
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate

    //상품 재고 스택
    private let beverageImages = [#imageLiteral(resourceName: "americano"), #imageLiteral(resourceName: "cafelatte"), #imageLiteral(resourceName: "chocolatemilk"), #imageLiteral(resourceName: "coke"), #imageLiteral(resourceName: "milkis"), #imageLiteral(resourceName: "plainmilk")]
    @IBOutlet var productStackView: UIStackView!
    @IBOutlet weak var productSample: ProductStackView!
    private var countLabelCollection: [UILabel] = []
    private var addStockButtonCollection: [UIButton] = []
    private var buyButtonCollection: [UIButton] = []
    private let itemTypes = VendingMachine.itemTypes
    
    //자판기 금액
    @IBOutlet var moneyButtonCollection: [UIButton]!
    @IBOutlet weak var moneyLabel: UILabel!
    private let moneyUnits = MoneyBox.Units.allCases
    
    //구매 목록
    @IBOutlet weak var dispensedListScrollView: UIScrollView!
    
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
                                               object: appDelegate.vendingMachine)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didBalanceChanged(_:)),
                                               name: VendingMachine.NotiKeys.balanceUpdate,
                                               object: appDelegate.vendingMachine)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didBoughtItem(_:)),
                                               name: VendingMachine.NotiKeys.dispensdListUpdate,
                                               object: appDelegate.vendingMachine)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter.updateDispensedList(scrollView: dispensedListScrollView,
                                      images: beverageImages,
                                      typeList: itemTypes)
    }
    
    private func updateOutletCollections() {
        for view in productStackView.arrangedSubviews {
            
            let stackView = view as! ProductStackView
            
            countLabelCollection.append(stackView.countLabel)
            
            addStockButtonCollection.append(stackView.addButton)
            stackView.addButton.addTarget(self, action: #selector(self.addStockTouched(_:)), for: .touchUpInside)
            
            buyButtonCollection.append(stackView.buyButton)
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
        presenter.addItemToDispensedList(scrollView: dispensedListScrollView,
                                      images: beverageImages,
                                      typeList: itemTypes)
    }
    
    @IBAction func addStockTouched(_ sender: UIButton) {
        if let targetIdx = addStockButtonCollection.firstIndex(of: sender) {
            let targetBeverage = itemTypes[targetIdx]
            appDelegate.vendingMachine.addStock(of: targetBeverage)
        }
    }
    
    @IBAction func addMoneyTouched(_ sender: UIButton) {
        if let targetIdx = moneyButtonCollection.firstIndex(of: sender) {
            let amount = moneyUnits[targetIdx].rawValue
            appDelegate.vendingMachine.insert(money: amount)
        }
    }
    
    @IBAction func buyItemTouched(_ sender: UIButton) {
        if let targetIdx = buyButtonCollection.firstIndex(of: sender) {
            let targetBeverage = itemTypes[targetIdx]
            appDelegate.vendingMachine.buy(itemType: targetBeverage)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let adminViewController = segue.destination as? AdminViewController,
              let productViews = sender as? [UIView] else { return }
        
        productViews.forEach { (view) in
            let data = ArchivingCenter.archive(with: view)
            adminViewController.sampleViewData.append(data)
        }
    }
    
    @IBAction func adminModeTouched(_ sender: UIButton) {
        performSegue(withIdentifier: "adminMode", sender: productStackView.arrangedSubviews)
    }
}
