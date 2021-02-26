//
//  Info.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/26.
//

import Foundation

protocol Info {
    func validate(with date: Date) -> Bool // 유통기한 확인
    func isHot() -> Bool // 뜨거운 음료 여부
    func isLowCalorie() -> Bool // 저칼로리 여부
}
