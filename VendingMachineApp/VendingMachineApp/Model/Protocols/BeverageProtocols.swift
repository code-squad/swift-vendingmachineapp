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
    
    func isExpired(compareTo date: Date) -> Bool
    
}

protocol LactoFreeable {
    
    func isLactoFree(basedOn lactoStandard: Float) -> Bool
}

protocol SugarFreeable {
    
    func isSugarFree(basedOn sugarStandard: Float) -> Bool
    
}

protocol Hotable {
    
    func isHot(basedOn temperature: Float) -> Bool
    
}
