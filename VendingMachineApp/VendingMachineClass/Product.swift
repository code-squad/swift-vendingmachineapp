//
//  Product.swift
//  VendingMachine
//
//  Created by jang gukjin on 01/07/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Product: Equatable, Hashable, Comparable, CustomStringConvertible {
    private var brand: String
    private var capacity: Int
    private var price: Int
    private var name: String
    private var date: Date

    var description: String {
        return ("\(name), \(price)원")
    }

    func hash(into: inout Hasher) {
        into.combine(name)
        into.combine(price)
    }

    init(brand: String, capacity: Int, price: Int, name: String, stringDate: String) {
        self.brand = brand
        self.capacity = capacity
        self.price = price
        self.name = name
        self.date = DateUtil.convertDate(of: stringDate)
    }

    /// 상품의 이름을 불러오는 메소드
    func getName() -> String {
        return name
    }

    /// 유통기한이 지났는지 확인하는 메소드
    func expireDate() -> Bool {
        return date < Date()
    }

    /// 가격을 불러오는 메소드
    func getPrice() -> Int {
        return price
    }

    /// Product 타입을 가지는 인스턴스가 같은지 확인하는 연산자
    static func ==(lhs: Product, rhs: Product) -> Bool {
    return lhs.name == rhs.name && lhs.price == rhs.price
    }

    /// Product 타입을 가지는 인스턴스의 크기를 비교하는 연산자
    static func <(lhs: Product, rhs: Product) -> Bool {
        return lhs.getName() < rhs.getName()
    }
}
