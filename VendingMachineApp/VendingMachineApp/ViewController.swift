//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/22.
//

import UIKit

class ViewController: UIViewController {

    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet var beverageCollectionView: UICollectionView!
    @IBOutlet var coinCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureNotification()
    }
    
    func configureCollectionView() {
        beverageCollectionView.delegate = self
        beverageCollectionView.dataSource = self
        coinCollectionView.delegate = self
        coinCollectionView.dataSource = self
    }
    
    func configureNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(addDrink(_:)),
                                               name: NSNotification.Name(rawValue: "BeveragePostButton"),
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(addCredit(_:)),
                                               name: NSNotification.Name(rawValue: "CoinPostButton"),
                                               object: nil)
    }
    
    @objc
    func addDrink(_ notification: Notification) {
        guard let beverageType = notification.userInfo?["type"] as? Beverage.Type else {
            return
        }
        guard let newDrink = BeverageFactory.create(type: beverageType) else {
            return
        }
        self.appDelegate.vendingMachine.append(newDrink)
        beverageCollectionView.reloadData()
    }
    
    @objc
    func addCredit(_ notification: Notification) {
        guard let coin = notification.userInfo?["coin"] as? Int else {
            return
        }
        self.appDelegate.vendingMachine.insertCoin(coin: coin)
        coinCollectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.beverageCollectionView {
            return self.appDelegate.vendingMachine.countType()
        }

        else if collectionView == self.coinCollectionView {
            return self.appDelegate.vendingMachine.countKindOfCoin()
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.beverageCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BeverageCollectionCell", for: indexPath) as? BeverageCollectionCell else {
                return UICollectionViewCell()
            }
 
            let beverageType = self.appDelegate.vendingMachine.beverageType(at: indexPath.item)
            let beverageCount = self.appDelegate.vendingMachine.countBeverage(at: indexPath.item)

            cell.updateUI(beverageType: String(describing: beverageType), count: beverageCount)
            cell.beverageType = { () in
                return beverageType
            }
            return cell
        }
        else if collectionView == self.coinCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoinCollectionCell", for: indexPath) as? CoinCollectionCell else {
                return UICollectionViewCell()
            }
            self.appDelegate.vendingMachine.eachCoin(at: indexPath.item) {
                cell.updateUI(at: $0)
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionFooter:
            guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CoinCollectionFooterView", for: indexPath) as? CoinCollectionFooterView else {
                return UICollectionReusableView()
            }
            footer.configure(at: self.appDelegate.vendingMachine.nowCredit().count())
            return footer
        default:
            return UICollectionReusableView()
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.beverageCollectionView {
            // 20 - beverage - 20 - beverage - 20 - beverage - 20
            let width:CGFloat = (collectionView.bounds.width - (20 * 4))/3
            let height = width
            
            return CGSize(width: width, height: height)
        }
        else if collectionView == self.coinCollectionView {
            // 20 - coin - 20 - coin - 20
            let width:CGFloat = (collectionView.bounds.width - (20 * 3))/2
            let height = width
            
            return CGSize(width: width, height: height)
        }
        return CGSize()
    }
}




