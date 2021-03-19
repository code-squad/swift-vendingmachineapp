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
    @IBOutlet weak var adminStackview: UIStackView!
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
        
        configureProductStacks()
    }
    
    private func configureProductStacks() {
        sampleViewData.forEach { (data) in
            let object = ArchivingCenter.unarchive(with: data)
            
            guard object != nil,
                  let productView = object as? ProductStackView else { return }
            productView.adminMode()
            adminStackview.addArrangedSubview(productView)
        }
        updateOutletCollections()
    }
    
    private func updateOutletCollections() {
        for view in adminStackview.arrangedSubviews {
            let productView = view as! ProductStackView
            productView.addButton.addTarget(self, action: #selector(AdminViewController.addStockTouched(_:)), for: .touchUpInside)
            addStockButtonCollection.append(productView.addButton)
            countLabelCollection.append(productView.countLabel)
        }
    }
    
    @objc func didStockListChanged(_ notification: Notification) {
        presenter.updateStocks(countLabels: countLabelCollection,
                               typeList: itemTypes)
    }
    
    @IBAction func addStockTouched(_ sender: UIButton) {
        if let targetIdx = addStockButtonCollection.firstIndex(of: sender) {
            let targetBeverage = itemTypes[targetIdx]
            workerInterface.addStock(of: targetBeverage)
        }
    }
    
    @IBAction func closeButtonTouched(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
