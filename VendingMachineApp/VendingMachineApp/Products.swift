//
//  Products.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 19. 1. 11..
//  Copyright © 2019 hngfu. All rights reserved.
//

import Foundation

class Products: NSObject, NSCoding {
    
    //MARK: - Keys
    
    private let productLinesKey: String = "productLines"
    
    //MARK: Encode, Decode
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(productLines, forKey: self.productLinesKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        productLines = aDecoder.decodeObject(forKey: self.productLinesKey) as! [String: ProductLine]
    }
    
    //MARK: - Properties
    //MARK: Private
    
    private var productLines: [String: ProductLine] = [:]
    
    //MARK: - Methods
    
    func add(product: Beverage) {

        if self.productLines[product.productType()] == nil {
            self.productLines[product.productType()] = ProductLine(beverageType: type(of: product))
        }
        
        self.productLines[product.productType()]?.add(product)
    }
    
    func buy(productType: Beverage.Type) -> Beverage? {
        
        guard let productLine = self.productLines["\(productType)"] else { return nil }
        guard let product = productLine.buy() else { return nil }
        
        if productLine.isEmpty() {
            self.productLines["\(productType)"] = nil
        }
        
        return product
    }
    
    func isBuyable(_ productType: Beverage.Type) -> ((Int) -> Bool)? {
        
        guard let productLine = self.productLines["\(productType)"] else { return nil }
        return productLine.isBuyable()
    }
    
    func updateNumber(of beverageType: Beverage.Type, update: (Int) -> Void) {
        productLines["\(beverageType)"]?.updateNumberLabel(update) ?? update(0)
    }
}
