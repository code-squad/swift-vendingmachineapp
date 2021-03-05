//
//  Extension.swift
//  VendingMachineApp
//
//  Created by Jun Ho JANG on 2021/02/26.
//

import Foundation
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 6e8d230f... 음료를 카테고리와 SKU로 구분해서 추가했습니다.

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
<<<<<<< HEAD
=======
>>>>>>> 7d448ba3... 학습한 내용을 요약해서 추가했습니다.
=======
>>>>>>> 6e8d230f... 음료를 카테고리와 SKU로 구분해서 추가했습니다.
