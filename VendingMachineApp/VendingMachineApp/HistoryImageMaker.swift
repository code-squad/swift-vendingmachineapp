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

    let baseY = 575
    let baseX = 40
    let space = 50

    func previousHistoryLog(log purchaseLog: [Beverage]) -> [BeverageImageView] {
        var logImages = [BeverageImageView]()
        for order in 0..<purchaseLog.count {
            let historyImageX = baseX + (order * space)
            let itemImage: BeverageImageView = BeverageImageView().getImage(of: purchaseLog[order])
            itemImage.frame = CGRect(x: historyImageX, y: baseY, width: 140, height: 100)
            logImages.append(itemImage)
        }
        return logImages
    }

    func updatePurchasedItemView(_ willPrint: (item: Beverage, index: Int)) -> BeverageImageView {
        let historyImageX = baseX + (willPrint.index * space)
        let itemImage: BeverageImageView = BeverageImageView().getImage(of: willPrint.item)
        itemImage.frame = CGRect(x: historyImageX, y: baseY, width: 140, height: 100)
        return itemImage
    }

}
