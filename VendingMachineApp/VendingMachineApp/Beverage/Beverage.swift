//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/02/26.
//

/*
 요구사항

 6가지 종류 음료수 상품을 판매하는 자판기 프로그램을 구현한다.
 자판기 구조체를 테스트하는 유닛테스트를 추가한다.
 XCTest로 단위 테스트를 위해서 테스트 타깃을 추가하거나 설정한다.
 프로그래밍 요구사항
 음료수

 음료수 클래스 계층을 음료수 최상위 객체부터 그룹을 만들어서 3단계 이상 구분한다.
 예시) 음료 (1단계)
 +---- 우유, 탄산음료, 커피, 에너지드링크 (2단계)
 +---- 딸기우유,초코우유 / 콜라,사이다 / TOP,칸타타,조지아 (3단계)
 상속 받은 하위 클래스에도 상위 클래스에 없는 적어도 하나 이상의 속성을 추가한다.
 예) 우유 농장 코드, 유통기한, 뜨거운음료여부, 카페인 함유량, 칼로리, 무가당여부, 패키지 재질 등
 추가한 속성에 대한 인터페이스와 함께 추가 인터페이스를 작성한다.
 유통기한 확인 validate(with date:Date) -> Bool
 뜨거운 음료여부 isHot() -> Bool
 저칼로리 여부 isLowCalorie() -> Bool
 음료수 클래스 인터페이스를 테스트하기 위한 테스트 코드를 작성한다.
 */

import Foundation

class Beverage: CustomStringConvertible {
    private let brand: String
    private let volume: Int
    private let price: Int
    private let name: String
    private let manufacturedAt: Date
    var description: String {
        return "\(brand), \(volume)ml, \(price)원, \(name), \(manufacturedAt.formattedDate())"
    }
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedAt: Date) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.manufacturedAt = manufacturedAt
    }
}
