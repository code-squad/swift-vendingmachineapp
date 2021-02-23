//
//  Beverage.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/23.
//

import Foundation

protocol Beverage {
    
    var brand: String { get }
    
    var name: String { get }
    
    var price: Int { get }
    
    var size: Int { get }
    
    var manufactureDate: Date { get }
    
}
