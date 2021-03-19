//
//  AdminModeViewUpdator.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/19.
//

import UIKit

protocol AdminModePresenter {
    
    func updateStocks(countLabels: [UILabel], typeList: [Shopable.Type])
    
}

class AdminModeViewUpdator: AdminModePresenter {
    
    private let workerInterface: WorkerInterface
    
    init(with workerInterface: WorkerInterface) {
        self.workerInterface = workerInterface
    }
    
    func updateStocks(countLabels: [UILabel], typeList: [Shopable.Type]) {
        let stockList = workerInterface.allStocks()
        
        for (idx, beverage) in typeList.enumerated() {
            let id = ObjectIdentifier(beverage)
            if let count = stockList[id] {
                countLabels[idx].text = "\(count)개"
            } else {
                countLabels[idx].text = "품절"
            }
        }
    }
}
