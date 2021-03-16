//
//  Storage.swift
//  VendingMachineApp
//
//  Created by Song on 2021/03/16.
//

import Foundation

protocol Storage {
    
    func add(_ item: Shopable)
    
    func pullOut(_ itemType: Shopable.Type) -> Shopable?
    
    func listTypeOnly() -> [ObjectIdentifier]
    
    func listTypeOnly(filter: (([ObjectIdentifier: [Shopable]]) -> [ObjectIdentifier])) -> [ObjectIdentifier]
    
    func listTypeCount() -> [ObjectIdentifier: Int]
    
    func listTypeCount(filter: (([ObjectIdentifier: [Shopable]]) -> [ObjectIdentifier: Int])) -> [ObjectIdentifier: Int]
    
}
