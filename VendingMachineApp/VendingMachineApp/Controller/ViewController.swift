//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by CHOMINJI on 25/09/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import UIKit

protocol VendingMachineViewType {
    var vendingMachine: VendingMachineType! { get set }
}

class ViewController: UIViewController, VendingMachineViewType {
    
    // MARK: Properties
    var vendingMachine: VendingMachineType!
    private let cellReuseID = "BeverageCollectionViewCell"
    private var beverages: [Item] {
        return vendingMachine.beverages
    }
    private var cardImageX: CGFloat = 0.0
    private let cardImageSpace: CGFloat = 50.0
    
    // MARK: IBOutlets
    
    @IBOutlet weak var beverageCollectionView: UICollectionView! 
    @IBOutlet weak var balanceLabel: UILabel!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(initStock),
                                               name: NSNotification.Name(NotificationID.stockAdded),
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(initStock),
                                               name: NSNotification.Name(NotificationID.stockRemoved),
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(initBalance),
                                               name: NSNotification.Name(rawValue: NotificationID.moneyInserted),
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(initBalance),
                                               name: NSNotification.Name(rawValue: NotificationID.moneyPurchased),
                                               object: nil)
        
        beverageCollectionView.dataSource = self
        initBalance()
        
        vendingMachine.showInventory { beverage in
            beverage.forEach { item in
                print("\(item.name) (\(item.count)개)")
            }
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Methods
    // MARK: IBActions
    
    @IBAction func touchInsertMoneyButton(_ sender: UIButton) {
        guard vendingMachine.insertMoney(amount: sender.tag) else {
            return
        }
    }
    
    @objc
    private func initBalance() {
        vendingMachine.showBalance { balance in
            balanceLabel.text = "잔액: \(balance) 원"
        }
    }
    
    @objc
    private func initStock() {
        beverageCollectionView.reloadData()
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
        cell.delegate = self
        cell.indexPath = indexPath
        
        let beverage = beverages[indexPath.row]
        cell.quantityLabel.text = "\(beverage.count)개"
        cell.beverageImageView.image = UIImage(named: beverage.imageName ?? "")
        
        return cell
    }
}

extension ViewController: BeverageCollectionViewCellDelegate {
    func beverageCell(_ cell: UICollectionViewCell, addItemAt indexPath: IndexPath) {
        guard let beverage =  vendingMachine.fetchBeverage(at: indexPath.item) else {
            return
        }
        vendingMachine.addStock(of: beverage, count: 1)
    }
    
    func beverageCell(_ cell: UICollectionViewCell, purchaseItemAt indexPath: IndexPath) {
        guard let beverage = vendingMachine.fetchBeverage(at: indexPath.item),
            let purchaseBeverage = vendingMachine.purchase(beverage: beverage, completion: nil) else {
                return
        }
        
        let cardImage = UIImageView(image: UIImage(named: purchaseBeverage.itemImageName))
        view.addSubview(cardImage)
        view.contentMode = .scaleAspectFill
        cardImageX += cardImageSpace
        cardImage.frame = CGRect(x: cardImageX, y: 575, width: 144.0, height: 144.0)
    }
}
