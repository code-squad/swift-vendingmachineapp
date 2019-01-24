//
//  PurchaseInfo.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 19. 1. 25..
//  Copyright © 2019 hngfu. All rights reserved.
//

import UIKit

struct PurchaseInfo {
    
    //MARK: - Properties
    //MARK: Private
    
    private var purchaseInfo: [String: CGFloat] = [:]
    
    //MARK: - Methods
    
    mutating func count(name: String) {
        
        if purchaseInfo[name] == nil {
            purchaseInfo[name] = 0
        }
        
        guard let number = purchaseInfo[name] else { return }
        
        purchaseInfo[name] = number + 1
    }
    
}
