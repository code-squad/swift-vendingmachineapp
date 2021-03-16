//
//  CoinCollectionCell.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/03/10.
//

import UIKit

class CoinCollectionCell: UICollectionViewCell {
    @IBOutlet var coinButton: UIButton!
    var coin: Money?
    
    func updateUI(at coin: Int) {
        let title = String(coin) + "원"
        self.coin = Money(how: coin)
        coinButton.setTitle(title, for: .normal)
        coinButton.addTarget(self, action: #selector(onTapButton), for: .touchUpInside)
    }
    
    @objc
    func onTapButton() {
        let userInfo: [AnyHashable:Any] = ["coin":coin?.count() ?? 0]
        
        NotificationCenter.default.post(
            name: NSNotification.Name(rawValue: "CoinPostButton"),
            object: nil, userInfo: userInfo)
    }
}
