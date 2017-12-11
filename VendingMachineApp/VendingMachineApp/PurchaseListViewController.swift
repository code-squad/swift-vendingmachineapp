//
//  PurchaseListViewController.swift
//  VendingMachineApp
//
//  Created by yangpc on 2017. 12. 11..
//  Copyright © 2017년 yang hee jung. All rights reserved.
//

import UIKit

class PurchaseListViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.updatePurchaseDrinkListLabel(noti:)),
                                               name: .didBuyDrinkNotifiacation,
                                               object: nil)

    }
    
    // 구매 목록 업데이트
    @objc private func updatePurchaseDrinkListLabel(noti: Notification?) {
        guard let userInfo = noti?.userInfo,
            let buyDrinkImageName = userInfo["buyDrinkImageName"] as? String,
            let countOfPurchases = userInfo["count"] as? Int else {
                return
        }
        let cardImage : UIImageView = UIImageView(image: UIImage(named: buyDrinkImageName))
        cardImage.frame = CGRect(x: 5+50*(countOfPurchases-1), y: 5, width: 215, height: 120)
        cardImage.contentMode = .scaleAspectFit
        self.view.addSubview(cardImage)
    }

}
