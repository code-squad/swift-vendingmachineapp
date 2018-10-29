//
//  Comment.swift
//  VendingMachine
//
//  Created by 이동건 on 23/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

enum Comment: CustomStringConvertible {
    var description: String {
        switch self {
        case .buy(let beverage, let price):
            return "\(beverage.tag(hasPrice: false))를 구매하셨습니다. \(price)원을 차감합니다."
        case .introdution(let account):
            return "현재 투입한 금액이 \(account)원입니다. 다음과 같은 음료가 있습니다."
        case .list(let bundles, let hasPrice):
            var result = hasPrice ? "" : "=>"
            let list = bundles.display {
                let prefix = hasPrice ? "\n\($0 + 1)" : ""
                return "\(prefix) \($1.tag(hasPrice: hasPrice)) \($2)개"
            }
            result += list
            return result
        case .history(let list):
            return list.isEmpty ? "히스토리가 없습니다." : "\(list)"
        case .add(let beverage, let count):
            return "\(beverage.tag(hasPrice: true))를 \(count)개 추가하였습니다."
        case .remove(let beverage):
            return "\(beverage.tag(hasPrice: false))를 폐기하였습니다."
        case .exit:
            return "모드 선택으로 돌아갑니다."
        }
    }
    case buy(beverage: Beverage, price: Int)
    case introdution(account: Int)
    case list(Bundles, hasPrice: Bool)
    case history(history: History)
    case add(Beverage, Int)
    case remove(Beverage)
    case exit
}
