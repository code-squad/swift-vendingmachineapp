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
    
    private let cardImageSize = CGSize(width: 144.0, height: 144.0)
    private let cardImageSpace: CGFloat = 50.0
    private var cardImageOrigin = CGPoint(x: 0.0, y: 575.0)
    
    // MARK: IBOutlets
    
    @IBOutlet weak var beverageCollectionView: UICollectionView! 
    @IBOutlet weak var balanceLabel: UILabel!
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addObservers()
        
        initCollectionView()
        initBalance()
        initHistory()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}

// MARK: - Action

extension ViewController {
    @IBAction func touchInsertMoneyButton(_ sender: UIButton) {
        guard vendingMachine.insertMoney(amount: sender.tag) else {
            return
        }
    }
    
    @objc
    private func refreshBalance() {
        vendingMachine.showBalance { balance in
            balanceLabel.text = "잔액: \(balance) 원"
        }
    }
    
    @objc
    private func refreshStock() {
        beverageCollectionView.reloadData()
    }
    
    @objc
    private func refreshHistory() {
        let histories = vendingMachine.fetchPurchaseHistory()
        guard let purchaseBeverage = histories.last else {
            return
        }
        
        let cardImage = createCardImageView(with: purchaseBeverage)
        view.addSubview(cardImage)
    }
}

// MARK: - Methods

extension ViewController {
    private func addObservers() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(refreshStock),
                                               name: NSNotification.Name(NotificationID.stockAdded),
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(refreshStock),
                                               name: NSNotification.Name(NotificationID.stockRemoved),
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(refreshBalance),
                                               name: NSNotification.Name(rawValue: NotificationID.moneyInserted),
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(refreshBalance),
                                               name: NSNotification.Name(rawValue: NotificationID.moneyPurchased),
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(refreshHistory),
                                               name: NSNotification.Name(rawValue: NotificationID.historyAdded),
                                               object: nil)
    }
    
    private func initCollectionView() {
        beverageCollectionView.dataSource = self
    }
    
    private func initBalance() {
        vendingMachine.showBalance { balance in
            balanceLabel.text = "잔액: \(balance) 원"
        }
    }
    
    private func initHistory() {
        let histories = vendingMachine.fetchPurchaseHistory()
        histories.forEach {
            let cardImage = createCardImageView(with: $0)
            view.addSubview(cardImage)
        }
    }
    
    private func createCardImageView(with beverage: Beverage) -> UIImageView {
        let cardImageView = UIImageView()
        cardImageView.image = UIImage(named: beverage.itemImageName)
        cardImageView.contentMode = .scaleAspectFill
        cardImageOrigin.x += cardImageSpace
        cardImageView.frame = CGRect(origin: cardImageOrigin, size: cardImageSize)
        return cardImageView
    }
}

// MARK: - CollectionView

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

// MARK: - Cell Delegate

extension ViewController: BeverageCollectionViewCellDelegate {
    func beverageCell(_ cell: UICollectionViewCell, addItemAt indexPath: IndexPath) {
        guard let beverage =  vendingMachine.fetchBeverage(at: indexPath.item) else {
            return
        }
        vendingMachine.addStock(of: beverage, count: 1)
    }
    
    func beverageCell(_ cell: UICollectionViewCell, purchaseItemAt indexPath: IndexPath) {
        guard let beverage = vendingMachine.fetchBeverage(at: indexPath.item) else {
                return
        }
         vendingMachine.purchase(beverage: beverage, completion: nil)
    }
}
