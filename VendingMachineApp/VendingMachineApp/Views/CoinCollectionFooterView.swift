//
//  CoinCollectionFooterView.swift
//  VendingMachineApp
//
//  Created by 지북 on 2021/03/11.
//

import UIKit

class CoinCollectionFooterView: UICollectionReusableView {
    @IBOutlet var creditLabel: UILabel!
    
    func configure(at credit: Int) {
        creditLabel.text = "잔액: " + String(credit)
    }
}
