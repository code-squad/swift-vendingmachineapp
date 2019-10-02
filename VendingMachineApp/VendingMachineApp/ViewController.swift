//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by CHOMINJI on 25/09/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK:  Properties
    
    private let vendingMachine = VendingMachine(storage: Storage())
    private var beverages: [ItemInfo] = []
    private let cellReuseID = "BeverageCollectionViewCell"
    
    // MARK: IBOutlets
    
    @IBOutlet weak var beverageCollectionView: UICollectionView!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        beverageCollectionView.dataSource = self
        
        vendingMachine.addStock(of: StrawberryMilk(), count: 2)
        vendingMachine.addStock(of: ChocolateMilk(), count: 5)
        vendingMachine.addStock(of: Coke(), count: 1)
        
        vendingMachine.showInventory { beverage in
            beverage.forEach { item in
                print("\(item.name) (\(item.count)개)")
            }
            self.beverages = beverage
        }
    }
}

// MARK: - Extensions
// MARK: CollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return beverages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseID, for: indexPath) as? BeverageCollectionViewCell else {
            return .init()
        }
        
        if let beverage = beverages.fetchInfo(at: indexPath.row) {
            cell.quantityLabel.text = beverage.name
            cell.beverageImageView.image = UIImage(named: beverage.imageName)
        }
        
        return cell
    }
}
