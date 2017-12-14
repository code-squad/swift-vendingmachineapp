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
    let vendingMachine = VendingMachine.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.updatePurchaseDrinkListLabel(noti:)),
            name: .didBuyDrinkNotifiacation,
            object: nil
        )
        collectionView.dataSource = dataSource
        dataSource.purchases = vendingMachine.listOfPurchase()
        dataSource.menu = vendingMachine.getMenu()
    }

    // 구매 목록 업데이트
    @objc private func updatePurchaseDrinkListLabel(noti: Notification?) {
        guard let userInfo = noti?.userInfo,
            let purchase = userInfo["purchase"] as? Drink else {
            return
        }
        dataSource.purchases.append(purchase)
        collectionView.reloadData()
    }

}

class PurchaseDataSource: NSObject, UICollectionViewDataSource {
    var purchases =  [Drink]()
    var menu = [Drink]()
    lazy var drinkImages: [UIImage] = {
        var images = [UIImage]()
        menu.forEach { images.append(UIImage(named: $0.className)!) }
        return images
    }()
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
        cell.displayDrinkImage(image: drinkImages[menu.index(of: drink)!])
        return cell
    }
}
