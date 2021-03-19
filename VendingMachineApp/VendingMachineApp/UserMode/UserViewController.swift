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
    private var buyViewModel: ButtonViewModel!
    private var countLabelCollection = [UILabel]()
    private var buyButtonCollection = [UIButton]()
    private let beverageImages = [#imageLiteral(resourceName: "americano"), #imageLiteral(resourceName: "cafelatte"), #imageLiteral(resourceName: "chocolatemilk"), #imageLiteral(resourceName: "coke"), #imageLiteral(resourceName: "milkis"), #imageLiteral(resourceName: "plainmilk")]
    private let itemTypes = VendingMachine.itemTypes
    
    //자판기 금액
    @IBOutlet var chargeViewModel: ChargeButtonViewModel!
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
        
        buyViewModel = BuyButtonViewModel(with: buyButtonCollection)
        
        buyViewModel.bind { (button, targetIdx) in
            let targetBeverage = self.itemTypes[targetIdx]
            self.userInterface.buy(itemType: targetBeverage)
        }
        
        chargeViewModel.bind { (button, targetIdx) in
            let amount = self.moneyUnits[targetIdx].rawValue
            self.userInterface.insert(money: amount)
        }

        presenter.updateBalance(label: moneyLabel)

        presenter.updateStocks(countLabels: countLabelCollection,
                               typeList: itemTypes)
        
        configureObservers()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter.updateDispensedList(scrollView: dispensedListScrollView,
                                      images: beverageImages,
                                      typeList: itemTypes)
    }
    
    private func updateOutletCollections() {
        productStackView.arrangedSubviews.forEach { (view) in
            let stackView = view as! ProductStackView
            countLabelCollection.append(stackView.countLabel)
            buyButtonCollection.append(stackView.buyButton)
        }
    }
    
    private func configureObservers() {
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
