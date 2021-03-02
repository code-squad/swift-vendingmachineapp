//
//  Payment.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/02/27.
//

import Foundation

class Payment {
    
    private var myMoney: Int
    
    init(myMoney:Int) {
        self.myMoney = 0
    }
    
    //MARK: 현금증가
    func increaseMoney(money:Int){
        self.myMoney += money
    }
    
    //MARK: 잔액확인
    func decreaseMoney(priceMoney:Int){
        self.myMoney -= priceMoney
    }
}
