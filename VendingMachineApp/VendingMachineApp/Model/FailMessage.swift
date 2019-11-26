//
//  Message.swift
//  VendingMachine
//
//  Created by 이진영 on 2019/11/21.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

enum FailMessage: CustomStringConvertible {
    case invalidInputMessage
    case unableToPurchaseMessage
    
    var description: String {
        switch self {
        case .invalidInputMessage:
            return "잘못된 입력"
        case .unableToPurchaseMessage:
            return "상품 구매 불가"
        }
    }
}
