//
//  main.swift
//  InheritanceEtc
//
//  Created by 임승혁 on 2020/03/12.
//  Copyright © 2020 임승혁. All rights reserved.
//

import Foundation

// 상속 + 이니셜라이저

class Beverage {
    var name: String
    var capacity: Int
    
    // 지정 이니셜라이저
    // designated initializer
    // 역할 : 모든 인스턴스의 저장 프로퍼티 값 초기화(할당)
    init(name: String, capacity: Int) {
        self.name = name
        self.capacity = capacity
    }
    
    // 편의 이니셜라이저
    // 자신이 가지고 있는 지정 이니셜라이저를 먼저 호출해줘야 한다.
    // 역할 : 지정 이니셜라이저를 통해 인스턴스 초기화
    convenience init(name: String) {
        self.init(name: name, capacity: 330)
    }
}

// 서브클래스의 저장 프로퍼티값이 초기화 후 슈퍼클래스의 저장 프로퍼티 값을 초기화 해야한다.
// super.init()으로 슈퍼클래스의 이니셜라이즈를 호출함. (반드시 지정 이니셜라이저를 호출, 편의 이니셜라이저는 호출 불가)
class Milk: Beverage {
    var grade: String
    // 지정 이니셜라이저
    init() {
        self.grade = "A+"
        super.init(name: "우유", capacity: 500)
    }
}

// result type
// 실패한 경우 오류를 가지고 온다.
// Success와 Failure를 가지고 있음.

enum ChickenError: Error {
    case gangwoon
    case influ
    case hacker
    case awm
}

func jump(_ coin: Int) -> Result<Int, ChickenError> {
    if coin < 0 {
        return .failure(.gangwoon)
    } else if coin == 0 {
        return .failure(.influ)
    } else if coin > 100 {
        return .failure(.hacker)
    } else if coin == 100 {
        return .failure(.awm)
    }
    
    return .success(1000)
}
