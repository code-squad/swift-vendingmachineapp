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
    @IBOutlet var productStackView: UserProductStackView!
    private var countLabelCollection = [UILabel]()
    private var buyButtonCollection = [UIButton]()
    private let beverageImages = [#imageLiteral(resourceName: "americano"), #imageLiteral(resourceName: "cafelatte"), #imageLiteral(resourceName: "chocolatemilk"), #imageLiteral(resourceName: "coke"), #imageLiteral(resourceName: "milkis"), #imageLiteral(resourceName: "plainmilk")]
    private let itemTypes = VendingMachine.itemTypes
    
    //자판기 금액
    @IBOutlet var moneyButtonCollection: [UIButton]!
    @IBOutlet weak var moneyLabel: UILabel!
    private let moneyUnits = MoneyBox.Units.allCases
    
    //구매 목록
    @IBOutlet weak var dispensedListScrollView: UIScrollView!
    
    private var userInterface: UserInterface!
    private var presenter: UserModePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userInterface = appDelegate.vendingMachine
        presenter = UserModeViewUpdator(with: userInterface)
        
        productStackView.configure(with: beverageImages)
        
        updateOutletCollections()

        presenter.updateBalance(label: moneyLabel)

        presenter.updateStocks(countLabels: countLabelCollection,
                               typeList: itemTypes)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didStockListChanged(_:)),
                                               name: VendingMachine.NotiKeys.stockListUpdate,
                                               object: userInterface)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didBalanceChanged(_:)),
                                               name: VendingMachine.NotiKeys.balanceUpdate,
                                               object: userInterface)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didBoughtItem(_:)),
                                               name: VendingMachine.NotiKeys.dispensdListUpdate,
                                               object: userInterface)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter.updateDispensedList(scrollView: dispensedListScrollView,
                                      images: beverageImages,
                                      typeList: itemTypes)
    }
    
    private func updateOutletCollections() {
        for view in productStackView.arrangedSubviews {
            let stackView = view as! ProductStackView
            stackView.buyButton.addTarget(self, action: #selector(UserViewController.buyItemTouched(_:)), for: .touchUpInside)

            countLabelCollection.append(stackView.countLabel)
            buyButtonCollection.append(stackView.buyButton)
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
    
    @IBAction func addMoneyTouched(_ sender: UIButton) {
        if let targetIdx = moneyButtonCollection.firstIndex(of: sender) {
            let amount = moneyUnits[targetIdx].rawValue
            userInterface.insert(money: amount)
        }
    }
    
    @IBAction func buyItemTouched(_ sender: UIButton) {
        if let targetIdx = buyButtonCollection.firstIndex(of: sender) {
            let targetBeverage = itemTypes[targetIdx]
            userInterface.buy(itemType: targetBeverage)
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
