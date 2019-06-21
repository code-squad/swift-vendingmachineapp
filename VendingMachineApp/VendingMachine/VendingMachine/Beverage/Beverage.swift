//
//  Beverage.swift
//  VendingMachine
//
//  Created by 김지나 on 01/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

// CustomStringConvertible : 모델 객채를 화면이나 디버깅 코드에 표시할 때, 텍스트적인 표현을 생성할 때 사용
// 특정 타입을 String으로 표현
class Beverage: CustomStringConvertible {
    private let brand: String
    private let volume: Int
    private let price: Int
    private let productName: String
    private let dateOfManufacture: Date
    private let expirationDate: Date
    
    init(brand: String, volume: Int, price: Int, productName: String, dateOfManufacture: Date = Date(), expirationDate: Date) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.productName = productName
        self.dateOfManufacture = dateOfManufacture
        self.expirationDate = expirationDate
    }
    
    // 클래스명 출력을 위한 변수
    var className: String {
        return String(describing: type(of: self))
    }
    
    // 상품명
    var beverageName: String {
        return "\(productName)"
    }
    
    // 상품가격
    var beveragePrice: Int {
        return price
    }

    // Date()의 결과를 원하는 형태로 출력되도록 포맷
    var description: String {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyyMMdd"
        let manufacDate = dateFormat.string(from: dateOfManufacture)
        
        return "\(className) - \(brand), \(volume)ml, \(price)원, \(productName), \(manufacDate)"
    }
    
    // 유통기간 확인(true = 유통기간 내)
    func validate() -> Bool {
        return self.dateOfManufacture < self.expirationDate
    }
}
