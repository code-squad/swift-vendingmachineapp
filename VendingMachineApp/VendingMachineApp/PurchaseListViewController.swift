//
//  PurchaseListViewController.swift
//  VendingMachineApp
//
//  Created by yangpc on 2017. 12. 11..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import UIKit

class PurchaseListViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    let dataSource = PurchaseDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.updatePurchaseDrinkListLabel(noti:)),
            name: .didBuyDrinkNotifiacation,
            object: nil
        )
        collectionView.dataSource = dataSource
        dataSource.purchases = VendingMachine.sharedInstance.listOfPurchase()
    }

    // 구매 목록 업데이트
    @objc private func updatePurchaseDrinkListLabel(noti: Notification?) {
        guard let userInfo = noti?.userInfo,
            let purchase = userInfo["purchase"] as? Drink else {
            return
        }
        var purchasesOfDataSource = dataSource.purchases
        purchasesOfDataSource.append(purchase)
        collectionView.insertItems(at: [IndexPath(item: purchasesOfDataSource.count - 1, section: 0)])
    }

}

class PurchaseDataSource: NSObject, UICollectionViewDataSource {
    var purchases =  [Drink]()

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
        ) -> Int {
        return purchases.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
        ) -> UICollectionViewCell {
        let identifier = "UICollectionViewCell"
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: identifier,
            for: indexPath)
            as! PurchaseCollectionViewCell
        let drink = purchases[indexPath.row]
        cell.displayDrinkImage(image: UIImage(named: drink.className)!)
        return cell
    }
}
