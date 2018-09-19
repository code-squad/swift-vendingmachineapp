//
//  Checker.swift
//  VendingMachine
//
//  Created by Yoda Codd on 2018. 8. 10..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

struct Checker {
    
    /// 문자열을 받아서 양의 정수로 치환 가능한지 체크. 가능하면 치환, 안되면 닐 리턴
    static func checkChangePlusInt(_ text:String)->Int?{
        guard let number = Int(text),number > 0 else {
            return nil
        }
        return number
    }
    
}
