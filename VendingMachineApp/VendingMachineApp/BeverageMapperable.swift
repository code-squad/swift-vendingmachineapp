//
//  BeverageMapperable.swift
//  VendingMachineApp
//
//  Created by zombietux on 2021/03/11.
//

import Foundation

protocol BeverageMapperable {
    func mapping(by tag: Int) -> Beverage.Type?
}
