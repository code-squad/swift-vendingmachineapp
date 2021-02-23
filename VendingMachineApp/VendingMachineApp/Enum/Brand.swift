//
//  Brand.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

enum MilkBrand : String, CustomStringConvertible {
    case SeoulMilk = "서울우유"
    case BINGGRAE = "빙그레"
    case Maeil = "매일우유"
    
    var description: String {
        return self.rawValue
    }
}

enum SodaBrand : String, CustomStringConvertible {
    case Pepsi = "펩시"
    case Coca = "코카"
    
    var description: String {
        return "\(self.rawValue)"
    }
}

enum CoffeeBrand : String, CustomStringConvertible {
    case Maxim = "맥심"
    
    var description: String {
        return "\(self.rawValue)"
    }
}
