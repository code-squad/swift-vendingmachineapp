//
//  DateFactory.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/02.
//

import Foundation

protocol DateFactory {
    
    func create(from string: String) -> Date
    
}

class SixDigitFactory: DateFactory {
    
    func create(from string: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyMMdd"
        
        let date = formatter.date(from: string)
        
        return date ?? Date()
    }
}

class EightDigitFactory: DateFactory {
    
    func create(from string: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        
        let date = formatter.date(from: string)
        
        return date ?? Date()
    }
}
