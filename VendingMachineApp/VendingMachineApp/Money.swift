//
//  Money.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/03/03.
//

import Foundation

class Money : NSObject, NSCoding{
    
    private var Money : Int
    
    init(money : Money.moneyUnit) {
        self.Money = money.rawValue
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.Money, forKey: "currentMoney")
    }
    
    required init?(coder: NSCoder) {
        self.Money = coder.decodeInteger(forKey: "currentMoney")
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
        NotificationCenter.default.post(name: NSNotification.Name("addSomething"), object: nil)
    }
    
    func canBuybeverage(price : Int) -> Bool{
        return self.Money > price
    }
    
    override var description: String{
        return "\(self.Money)원"
    }
}

