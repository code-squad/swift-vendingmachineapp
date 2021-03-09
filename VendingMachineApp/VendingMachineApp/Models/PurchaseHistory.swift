//
//  PurchaseLog.swift
//  VendingMachineApp
//
//  Created by 김지선 on 2021/03/08.
//

import Foundation

class PurchaseHistory {
    private var history: [Beverage]
    
    init() {
        history = []
    }
    
    func add(beverage: Beverage){
        history.append(beverage)
    }
    
//    func show() -> [Beverage] -> 이거보다 좋은 방법이 없을까..?
    func show(_ handler: (Beverage) -> Void){
        history.forEach { handler($0) }
    }
}
