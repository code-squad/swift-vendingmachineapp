//
//  MilkFactory.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/03/09.
//

import Foundation
<<<<<<< HEAD

class MilkFactory: addBeverage {
    
    static func addBeverage<T>(type sku: T, manufacturedAt: Date, expiration: Date) -> Beverage? {
        switch sku {
        case is SeoulSterilized.Type:
            return SeoulSterilized(manufacturedAt: manufacturedAt, expiration: expiration)
        case is SeoulStrawberry.Type:
            return SeoulStrawberry(manufacturedAt: manufacturedAt, expiration: expiration)
        case is SeoulChoco.Type:
            return SeoulChoco(manufacturedAt: manufacturedAt, expiration: expiration)
        default:
            return nil
        }
    }
    
}
=======
>>>>>>> b3a143a0... 개별 음료 뷰를 하나의 스택뷰로 묶을 수 있는 객체를 만들었습니다.
