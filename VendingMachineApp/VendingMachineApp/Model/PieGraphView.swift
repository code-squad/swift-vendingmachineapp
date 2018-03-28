//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by Eunjin Kim on 2018. 3. 29..
//  Copyright © 2018년 Eunjin Kim. All rights reserved.
//

import UIKit

class PieGraphView: UIView {
    private var listOfBeveragePurchases = [PurchaseProduct]()
    
    func drawRect() {
        
    }
}

extension PieGraphView: PieDrawable {
    func sendData(data: [PurchaseProduct]) {
        listOfBeveragePurchases = data
    }
}
