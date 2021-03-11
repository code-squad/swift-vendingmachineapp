//
//  ViewController.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/02/22.
//

import UIKit

class ViewController: UIViewController {
    
    var vendingMachine = VendingMachine()
    @IBOutlet var drinkCollectionView: UICollectionView!
    @IBOutlet var coinCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureNotification()
    }
    
    func configureCollectionView() {
        drinkCollectionView.delegate = self
        drinkCollectionView.dataSource = self
        coinCollectionView.delegate = self
        coinCollectionView.dataSource = self
    }
    
    func configureNotification() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(addDrink(_:)),
                                               name: NSNotification.Name(rawValue: "DrinkPostButton"),
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(addCredit(_:)),
                                               name: NSNotification.Name(rawValue: "CoinPostButton"),
                                               object: nil)
    }
    
    @objc
    func addDrink(_ notification: Notification) {
        guard let drinkType = notification.object else {
            return
        }
        guard let newDrink = DrinkFactory.create(type: drinkType as! Drink.Type) else {
            return
        }
        vendingMachine.append(newDrink)
        drinkCollectionView.reloadData()
    }
    
    @objc
    func addCredit(_ notification: Notification) {
        guard let coin = notification.object else {
            return
        }
        vendingMachine.insertCoin(coin: coin as! Int)
        coinCollectionView.reloadData()
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.drinkCollectionView {
            return vendingMachine.countType()
        }
        
        else if collectionView == self.coinCollectionView {
            return vendingMachine.countKindOfCoin()
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.drinkCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DrinkCollectionCell", for: indexPath) as? DrinkCollectionCell else {
                return UICollectionViewCell()
            }
            
            let drinkType = vendingMachine.drinkType(at: indexPath.item)
            let drinkStock = vendingMachine.drinkStock(at: indexPath.item)
            cell.updateUI(drinkType: String(describing: drinkType), count: drinkStock)
            cell.drinkType = { () in
                return drinkType
            }
            return cell
        }
        else if collectionView == self.coinCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CoinCollectionCell", for: indexPath) as? CoinCollectionCell else {
                return UICollectionViewCell()
            }
            vendingMachine.eachCoin(at: indexPath.item) {
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
            footer.configure(at: vendingMachine.nowCredit().count())
            return footer
        default:
            return UICollectionReusableView()
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.drinkCollectionView {
            // 20 - drink - 20 - drink - 20 drink - 20
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




