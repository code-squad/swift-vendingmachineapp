//
//  Products.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 19. 1. 11..
//  Copyright © 2019 hngfu. All rights reserved.
//

import Foundation

class Products: NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(productLines, forKey: ProductsArchiveKey.products)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        productLines = aDecoder.decodeObject(forKey: ProductsArchiveKey.products) as! [String: [BeverageProduct]]
    }
    
    //MARK: - Properties
    private var productLines: [String: [BeverageProduct]] = [:]
    
    //MARK: - Methods
    func add(product: BeverageProduct) {

        if self.productLines[product.productType()] == nil {
            self.productLines[product.productType()] = []
        }
        
        self.productLines[product.productType()]?.append(product)
    }
    
    func buy(productType: BeverageProduct.Type) -> BeverageProduct? {
        
        let product = self.productLines["\(productType)"]?.popLast()
        
        if self.productLines["\(productType)"]?.count == 0 {
            self.productLines["\(productType)"] = nil
        }
        
        return product
    }
    
    func updateNumber(of beverageType: BeverageProduct.Type, update: (Int) -> Void) {
        update(productLines["\(beverageType)"]?.count ?? 0)
    }
}
