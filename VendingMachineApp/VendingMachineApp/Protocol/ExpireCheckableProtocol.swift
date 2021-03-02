//
//  DrinkableProtocol.swift
//  VendingMachineApp
//
//  Created by kiyoungj on 2021/02/25.
//

import Foundation

protocol ExpireCheckableProtocol {
    
    func isExpireDate(itemDate: Date) -> Bool
}
