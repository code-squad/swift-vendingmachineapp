//
//  AdminViewController.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/17.
//

import UIKit

class AdminViewController: UIViewController {
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //상품 재고 스택
    @IBOutlet weak var adminStackview: AdminProductStackView!
    private var addViewModel: ButtonViewModel!
    private var addStockButtonCollection = [UIButton]()
    private var countLabelCollection = [UILabel]()
    private let itemTypes = VendingMachine.itemTypes
    
    var sampleViewData = [Data]()
    
    private var workerInterface: WorkerInterface!
    private var presenter: AdminModePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        workerInterface = appDelegate.vendingMachine
        presenter = AdminModeViewUpdator(with: workerInterface)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didStockListChanged(_:)),
                                               name: VendingMachine.NotiKeys.stockListUpdate,
                                               object: workerInterface)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        adminStackview.configure(with: sampleViewData)
        updateOutletCollections()
        
        addViewModel = AddStockButtonViewModel(with: addStockButtonCollection)
        
        addViewModel.bind { (button, targetIdx) in
            let targetBeverage = self.itemTypes[targetIdx]
            self.workerInterface.addStock(of: targetBeverage)
        }
    }
    
    private func updateOutletCollections() {
        adminStackview.arrangedSubviews.forEach { (view) in
            let productView = view as! ProductStackView
            addStockButtonCollection.append(productView.addButton)
            countLabelCollection.append(productView.countLabel)
        }
    }
    
    @objc func didStockListChanged(_ notification: Notification) {
        presenter.updateStocks(countLabels: countLabelCollection,
                               typeList: itemTypes)
    }
    
    @IBAction func closeButtonTouched(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
