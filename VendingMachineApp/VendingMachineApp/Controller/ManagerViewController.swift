//
//  ManagerViewController.swift
//  VendingMachineApp
//
//  Created by CHOMINJI on 15/11/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

class ManagerViewController: UIViewController, VendingMachineViewType {
    
    var vendingMachine: VendingMachineType!
    private var beverages: [Item] {
        return vendingMachine.beverages
    }
    
    @IBOutlet weak var beverageCollectionView: UICollectionView!
    @IBOutlet weak var pieGraphView: PieGraphView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(refreshStock),
                                               name: NSNotification.Name(NotificationID.stockAdded),
                                               object: nil)

        beverageCollectionView.dataSource = self
        pieGraphView.dataSource = vendingMachine.history
        
    }
    
    @IBAction func touchCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc
    private func refreshStock() {
        beverageCollectionView.reloadData()
    }
}

// MARK: - Extensions
// MARK: CollectionViewDataSource

extension ManagerViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return beverages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BeverageCollectionViewCell.reuseID, for: indexPath) as? BeverageCollectionViewCell else {
            return .init()
        }
        cell.delegate = self
        cell.indexPath = indexPath
        
        let beverage = beverages[indexPath.row]
        cell.quantityLabel.text = "\(beverage.count)개"
        cell.beverageImageView.image = UIImage(named: beverage.imageName ?? "")
        
        return cell
    }
}

extension ManagerViewController: BeverageCollectionViewCellDelegate {
    func beverageCell(_ cell: UICollectionViewCell, itemAt indexPath: IndexPath) {
        guard let beverage =  vendingMachine.fetchBeverage(at: indexPath.item) else {
            return
        }
        vendingMachine.addStock(of: beverage, count: 1)
    }
}
