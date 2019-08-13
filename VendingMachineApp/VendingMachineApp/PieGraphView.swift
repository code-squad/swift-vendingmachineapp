//
//  PieGraphView.swift
//  VendingMachineApp
//
//  Created by hw on 12/08/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import UIKit


class PieGraphView: UIView {
    private var historySet: [String: Int] = [String: Int]()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initializeHistorySet()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initializeHistorySet()
        isOpaque = false
    }
    
    
    func initializeHistorySet() {
        let list = VendingMachine.sharedInstance.showShoppingHistory().list
        for drink in list {
            guard let value = historySet[drink.name] else{
                historySet.updateValue(1, forKey: drink.name)
                continue
            }
            historySet.updateValue(value+1, forKey: drink.name)
        }
    }
    
    private func calculateTotalCount() -> Int{
        let temporalMap = historySet.map{ (key: String, value: Int) -> Int in return value }
        let totalCount = temporalMap.reduce(0, {(value1: Int, value2: Int) -> Int in return value1+value2})
        return totalCount
    }
    
    override func draw(_ rect: CGRect) {
        
    }
}
