//
//  AdminViewController.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/17.
//

import UIKit

class AdminViewController: UIViewController {
    
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private var presenter: VendingMachineViewPresenter!

    @IBOutlet weak var adminStackview: UIStackView!
    private let itemTypes = VendingMachine.itemTypes
    private var addStockButtonCollection = [UIButton]()
    private var countLabelCollection = [UILabel]()
    var sampleViewData = [Data]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = VendingMachineViewUpdator(userInterface: appDelegate.vendingMachine,
                                              workerInterface: appDelegate.vendingMachine)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didStockListChanged(_:)),
                                               name: VendingMachine.NotiKeys.stockListUpdate,
                                               object: appDelegate.vendingMachine)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        sampleViewData.forEach { (data) in
            let object = ArchivingCenter.unarchive(with: data)
            
            guard object != nil,
                  let view = object as? ProductStackView else { return }
            view.buyButton.isHidden = true
            view.addButton.isHidden = false
            view.addButton.tintColor = .darkGray
            view.imageView.layer.cornerRadius = view.bounds.height * 0.08
            addStockButtonCollection.append(view.addButton)
            countLabelCollection.append(view.countLabel)
            view.addButton.addTarget(self, action: #selector(self.addStockTouched(_:)), for: .touchUpInside)
            adminStackview.addArrangedSubview(view)
        }
    }
    
    @IBAction func closeButtonTouched(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func didStockListChanged(_ notification: Notification) {
        presenter.updateStocks(countLabels: countLabelCollection,
                               typeList: itemTypes)
    }
    
    @IBAction func addStockTouched(_ sender: UIButton) {
        if let targetIdx = addStockButtonCollection.firstIndex(of: sender) {
            let targetBeverage = itemTypes[targetIdx]
            appDelegate.vendingMachine.addStock(of: targetBeverage)
        }
    }
}
