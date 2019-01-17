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
        aCoder.encode(products, forKey: ProductsArchiveKey.products)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        products = aDecoder.decodeObject(forKey: ProductsArchiveKey.products) as! [String: [BeverageProduct]]
    }
    
    //MARK: - Properties
    private var products: [String: [BeverageProduct]] = [:]
    
    //MARK: - Methods
    func add(product: BeverageProduct) {

        if self.products[product.productType()] == nil {
            self.products[product.productType()] = []
        }
        
        self.products[product.productType()]?.append(product)
    }
    
    func buy(productType: BeverageProduct.Type) -> BeverageProduct? {
        
        let product = self.products["\(productType)"]?.popLast()
        
        if self.products["\(productType)"]?.count == 0 {
            self.products["\(productType)"] = nil
        }
        
        return product
    }
    
    func updateNumber(of beverageType: BeverageProduct.Type, update: (Int) -> Void) {
        update(products["\(beverageType)"]?.count ?? 0)
    }
}
