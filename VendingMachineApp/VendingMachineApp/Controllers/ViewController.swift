//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 이동건 on 29/10/2018.
//  Copyright © 2018 이동건. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    private let inset: CGFloat = 20
    private let spacing: CGFloat = 20
    private let itemsOnRow = 4
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var accountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVendingMachine()
    }
    
    //MARK: Setup
    private func setupVendingMachine() {
        setupNotificationObserver()
        setupVendingMachineAccount()
    }
    
    private func setupNotificationObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleBeverageAdded), name: VendingMachineNotification.didAdd.name, object: nil)
    }
    
    private func setupVendingMachineAccount(with money: DepositType.Thousand? = nil) {
        if let money = money {
            appDelegate.vendingMachine.deposit(money.value)
        }
        accountLabel.text = "금액 \(appDelegate.vendingMachine.remain)원"
    }
    
    //MARK: Actions
    @objc func handleBeverageAdded(_ notification: Notification) {
        guard let className = notification.object as? String else { return }
        let beverage = WareHouse.generateBeverage(by: className)
        appDelegate.vendingMachine.add(beverage)
        collectionView.reloadData()
    }
    
    @IBAction func oneThousandDidTapped(_ sender: Any) {
        setupVendingMachineAccount(with: .one)
        
    }
    @IBAction func fiveThousandDidTapped(_ sender: Any) {
        setupVendingMachineAccount(with: .five)
    }
}

//MARK:- UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BeverageCell.reuseIdentifier, for: indexPath) as? BeverageCell else {
            return UICollectionViewCell()
        }
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return UICollectionViewCell() }
        
        
        let bundle = appDelegate.vendingMachine.bundles[indexPath.item]
        
        cell.setup { (imageView, label) in
            imageView.image = UIImage(named: bundle.beverage.className)
            label.text = "\(bundle.count)개"
        }
        
        cell.addButtonDidTapped = {
            NotificationCenter.default.post(name: VendingMachineNotification.didAdd.name, object: bundle.beverage.className)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return 0 }
        
        return appDelegate.vendingMachine.bundles.count
    }
}

//MARK:- UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewWidth: CGFloat = collectionView.frame.width
        let insetSpacing = inset * 2
        let itemSpacing = spacing * CGFloat(itemsOnRow)
        
        let width = (collectionViewWidth - insetSpacing - itemSpacing) / CGFloat(itemsOnRow)
        let height = width * 1.2
        
        return CGSize(width: width, height: height)
    }
}

