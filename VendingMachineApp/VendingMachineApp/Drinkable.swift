//
//  Drinkable.swift
//  VendingMachineApp
//
//  Created by Ador on 2021/02/23.
//

import Foundation

protocol Drinkable {
    var manufacturer: String { get set }
    var volume: Int { get set }
    var brand: String { get set }
    var dateOfManufacture: Date { get set }
    var price: Int { get set }
}
