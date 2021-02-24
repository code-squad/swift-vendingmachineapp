//
//  Protocols.swift
//  VendingMachineApp
//
//  Created by 조중윤 on 2021/02/24.
//

import Foundation

protocol MoneyExchangable {
    var money: Int { get set }
    
    func increaseMoney(by amount: Int)
    func deductMoney(by amount: Int)
    func sendMoney(amount: Int, to counterPart: MoneyExchangable)
}
