//
//  Money.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/03/03.
//

import UIKit

class Money {
    private var Money : Int
    
    init(money : Int) {
        self.Money = money
    }
 
    enum moneyUnit : Int, CaseIterable{
        case OneThousand = 1000, fiveThousand = 5000
        
        init?(index : Int) {
            switch index{
            case 0:
                self = .OneThousand
            case 1:
                self = .fiveThousand
            default:
                return nil
            }
        }
    }
    
    func addMoney(money : Money) -> Void{
        self.Money += money.Money
    }
    
    func canBuybeverage(price : Int) -> Bool{
        return self.Money > price
    }
    
    func showCurrentMoney(moneyLabel : UILabel){
        moneyLabel.text = "\(String(self.Money))원"
    }
}
