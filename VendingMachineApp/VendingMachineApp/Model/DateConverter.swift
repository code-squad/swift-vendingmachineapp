//
//  DateConverter.swift
//  VendingMachineApp
//
//  Created by Lia on 2021/03/02.
//

import Foundation

struct DateConverter {

    static func makeDate(year: Int, month: Int, day: Int) -> Date {
        let calendar = Calendar(identifier: .gregorian)
        var dateComponents = DateComponents()
        
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        
        let date = calendar.date(from: dateComponents) ?? Date()
        
        return date
    }
    
    static func format(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: date)
        
        return dateString
    }
    
}

let date = DateConverter.makeDate(year: 2020, month: 12, day: 20)

//func dateFormatter(with date: String) {
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "YY년 MM월 dd일"
//
//    //    let string1 = "18년 2월 1일"
//
//    let day = dateFormatter.date(from: date)
//}
