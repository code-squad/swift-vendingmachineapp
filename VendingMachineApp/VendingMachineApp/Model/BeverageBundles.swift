//
//  Bundles.swift
//  VendingMachine
//
//  Created by 이동건 on 23/10/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class BeverageBundles: NSObject, NSSecureCoding {
    private var bundles: [BeverageBundle]
    subscript(index: Int) -> BeverageBundle {
        return bundles[index]
    }
    var count: Int {
        return bundles.count
    }
    
    static var supportsSecureCoding: Bool {
        return true
    }
    
    init(_ bundles: [BeverageBundle]) {
        self.bundles = bundles
    }
    
    required init?(coder aDecoder: NSCoder) {
        bundles = aDecoder.decodeObject(forKey: "bundles") as! [BeverageBundle]
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(bundles, forKey: "bundles")
    }
    
    func get(at index: Int) throws -> Beverage {
        if index < 0 { throw VendingMachineError.outOfStock }
        return bundles[index].beverage
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
