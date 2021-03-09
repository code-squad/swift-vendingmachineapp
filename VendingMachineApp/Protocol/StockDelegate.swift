//
//  StockDelegate.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/09.
//

import Foundation

protocol StockDelegate {
    func addStock(type : Beverage.Type)
}
