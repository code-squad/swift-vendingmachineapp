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
    
    func show(_ handler: (Beverage) -> Void){
        history.forEach { handler($0) }
    }
}
