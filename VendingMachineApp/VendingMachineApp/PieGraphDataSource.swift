//
//  PieGraphDataSource.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 19. 1. 25..
//  Copyright © 2019 hngfu. All rights reserved.
//

import Foundation

protocol PieGraphDataSource {
    
    var historyOfPurchase: [String: Int] {get set}
    
}
