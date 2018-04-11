//
//  HistoryImageMaker.swift
//  VendingMachineApp
//
//  Created by YOUTH2 on 2018. 4. 3..
//  Copyright © 2018년 JINiOS. All rights reserved.
//

import Foundation
import UIKit

class HistoryImageMaker {

    let baseY = 600
    let baseX = 40
    let space = 50

    func previousHistoryLog(log purchaseLog: [Beverage]) -> [BeverageImageView] {
        var logImages = [BeverageImageView]()
        for order in 0..<purchaseLog.count {
            let historyImageX = baseX + (order * space)
            let itemImage: BeverageImageView = BeverageImageView().getImage(of: purchaseLog[order])
            itemImage.clipsToBounds = true
            itemImage.layer.borderWidth = 5
            itemImage.layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
            itemImage.layer.cornerRadius = 15.0
            itemImage.frame = CGRect(x: historyImageX, y: baseY, width: 140, height: 130)
            logImages.append(itemImage)
        }
        return logImages
    }

    func updatePurchasedItemView(_ willPrint: (item: Beverage, index: Int)) -> BeverageImageView {
        let historyImageX = baseX + (willPrint.index * space)
        let itemImage: BeverageImageView = BeverageImageView().getImage(of: willPrint.item)
        itemImage.clipsToBounds = true
        itemImage.layer.borderWidth = 5
        itemImage.layer.borderColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        itemImage.layer.cornerRadius = 15.0
        itemImage.frame = CGRect(x: historyImageX, y: baseY, width: 140, height: 130)
        return itemImage
    }

}
