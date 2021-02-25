//
//  BeverageProtocols.swift
//  VendingMachineApp
//
//  Created by Song on 2021/02/25.
//

import Foundation


protocol Transportable {
    
    func isTransportable() -> Bool
    
}

protocol Expirable {
    
    func isExpired() -> Bool
    
}

protocol LactoFreeable {
    
    func isLactoFree() -> Bool
}

protocol SugarFreeable {
    
    func isSugarFree() -> Bool
    
}

protocol Hotable {
    
    func isHotable() -> Bool
    
}
