//
//  AdminMode.swift
//  VendingMachineApp
//
//  Created by oingbong on 04/10/2018.
//  Copyright © 2018 oingbong. All rights reserved.
//

import Foundation

struct AdminMode {
    let manageable: Manageable
    
    init(with manageable: Manageable) {
        self.manageable = manageable
    }
    
    public func start(type: MenuAdmin, target: Int, amount: Int) {
        var isContinue = true
        while isContinue {
            isContinue = self.selectMenu(with: type, target: target, amount: amount)
        }
    }
    
    public func selectMenu(with type: MenuAdmin, target: Int, amount: Int) -> Bool {
        switch type {
        case .addStock:
            // 재고추가
            _ = self.addStock(target: target, amount: amount)
            return true
        case .deleteStock:
            // 재고삭제
            _ = self.deleteStock(target: target, amount: amount)
            return true
        case .exit:
            return false
        }
    }
    private func addStock(target: Int, amount: Int ) -> [Beverage] {
        let beverages = AddingBeverage.select(target: target, amount: amount)
        let addedBeverages = manageable.addStock(with: beverages)
        
        // 옵저버 알림
        let name = Notification.Name(NotificationKey.addStock)
        NotificationCenter.default.post(name: name, object: nil)
        
        return addedBeverages
    }
    
    private func deleteStock(target: Int, amount: Int) -> [Beverage] {
        let removedBeverages = manageable.removeStock(target: target, amount: amount)
        return removedBeverages
    }
    
}
