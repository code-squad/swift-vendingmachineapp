//
//  Extension.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/02/26.
//

import Foundation
<<<<<<< HEAD

extension Date {
    
    func stringToDate(date: String) -> Date {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        var targetDate = Date()
        if let someDate = dateFormat.date(from: date) {
            targetDate = someDate
        }
        return targetDate
    }
    
}
=======
>>>>>>> 7d448ba3... 학습한 내용을 요약해서 추가했습니다.
