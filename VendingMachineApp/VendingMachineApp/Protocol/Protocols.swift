//
//  Protocols.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/02/26.
//

import Foundation

//MARK: 상품유통기한 확인 프로토콜
protocol ExpireCheckableProtocol {
    
    func isExpireDate(with date: Date) -> Bool
}


