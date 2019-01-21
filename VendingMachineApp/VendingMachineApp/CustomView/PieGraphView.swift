//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by 윤지영 on 18/01/2019.
//  Copyright © 2019 윤지영. All rights reserved.
//

import UIKit

class PieGraphView: UIView {
    private var purchases: [Beverage] = []

    var countOfPurchase: Int {
        return purchases.count
    }

    func updated(with beverages: ArraySlice<Beverage>) {
        beverages.forEach { purchases.append($0) }
    }

}
