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
        products = aDecoder.decodeObject(forKey: ProductsArchiveKey.products) as! [Int: [Beverage]]
    }
    
    //MARK: - Properties
    private var products: [Int: [Beverage]] = [:]
    
    //MARK: - Methods
    func add(tag: Int) {
        
        guard let productType = Mapper.map[tag] else { return }
        let product = Beverage.produce(product: productType)
        
        if self.products[tag] == nil {
            self.products[tag] = []
        }
        
        self.products[tag]?.append(product)
    }
    
    func buy(tag: Int) -> Beverage? {
        let product = self.products[tag]?.popLast()
        if self.products[tag]?.count == 0 {
            self.products[tag] = nil
        }
        return product
    }

    func inventory() -> [String: Int] {
        var inventoryStatus: [String: Int] = [:]
        
        for (_, products) in self.products {
            guard !products.isEmpty else {continue}
            let name = { (name: String) -> String in
                return name
            }
            let beverageName = products[0].name(read: name)
            inventoryStatus[beverageName] = products.count
        }
        
        return inventoryStatus
    }
    
    func updateNumber(of tag: Int, update: (Int) -> Void) {
        update(products[tag]?.count ?? 0)
    }
    
    func expiredProducts() -> [Beverage] {
        var expiredProducts: [Beverage] = []
        
        for (_, products) in self.products {
            expiredProducts.append(contentsOf: products.filter {$0.isExpiryDateOut()})
        }
        
        return expiredProducts
    }
    
    func hotProducts() -> [String] {
        var hotProducts: [String] = []
        
        for (_, products) in self.products {
            guard !products.isEmpty else {continue}
            guard let variousTemperaturesBeverage = products[0] as? VariousTemperatures else {continue}
            guard variousTemperaturesBeverage.isHot else {continue}
            hotProducts.append(products[0].name { (name: String) -> String in
                return name
            })
        }
        return hotProducts
    }
}
