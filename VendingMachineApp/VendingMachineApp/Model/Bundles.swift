//
//  Bundles.swift
//  VendingMachine
//
//  Created by 이동건 on 23/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Bundles {
    private var bundles: [Bundle]
    var count: Int {
        return bundles.count
    }
    
    init(_ bundles: [Bundle]) {
        self.bundles = bundles
    }
    
    func get(at index: Int) throws -> Beverage {
        if index <= 0 { throw VendingMachineError.outOfStock }
        return bundles[index - 1].beverage
    }
    
    func hasBundle(of index: Int) -> Bool {
        return count > 0 && count <= index
    }
    
    func display(_ handler: (_ offset: Int, _ beverage: Beverage, _ count: Int)->(String)) -> String {
        var result = ""
        bundles.enumerated().forEach {
            result += handler($0.offset, $0.element.beverage, $0.element.count)
        }
        return result
    }
    
    func contains(_ beverage: Beverage) -> Bool {
        return !bundles.filter {$0.contains(beverage)}.isEmpty
    }
    
}
