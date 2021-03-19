//
//  VendingMachinedable.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/03/16.
//

import Foundation

protocol UserVendingMachinedable {
    func setVendingMachine(_ vendingMachined : UserModable)
}

protocol AdminVendingMachinedable {
    func setVendingMachine(_ vendingMachined : AdminModable)
}
