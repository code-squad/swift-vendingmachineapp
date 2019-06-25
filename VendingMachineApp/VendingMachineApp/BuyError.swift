//
//  BuyError.swift
//  VendingMachine
//
//  Created by joon-ho kil on 6/19/19.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum BuyError: Error {
    case NotEnoughBalance
    case NonStock
    
    var localizedDescription: String {
        switch self {
        case .NotEnoughBalance:
            return "금액이 부족합니다."
        case .NonStock:
            return "해당 음료의 재고가 없습니다."
        }
    }
}
