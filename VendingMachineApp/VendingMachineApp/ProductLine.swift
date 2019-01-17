//
//  ProductLine.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 19. 1. 17..
//  Copyright © 2019 hngfu. All rights reserved.
//

import Foundation

class ProductLine: NSObject, NSCoding {
    
    //MARK: Keys
    
    private let productLineKey: String = "productLine"
    
    //MARK: - encode,decode
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.productLine, forKey: productLineKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        self.init()
        self.productLine = aDecoder.decodeObject(forKey: productLineKey) as! [BeverageProduct]
    }
    
    //MARK: - Properties
    //MARK: Private
    
    private var productLine: [BeverageProduct] = [] {
        didSet {
            guard productLine.count != 0 else { return }
            
            let userInfo: [String: Int] = [UserInfoKey.numberOfProduct: productLine.count]
            
            NotificationCenter.default.post(name: .didChangeNumberOfProduct, object: nil, userInfo: userInfo)
        }
    }
    
    //MARK: - Methods
    //MARK: Private
    
    func add(_ beverage: BeverageProduct) {
        self.productLine.append(beverage)
    }
    
    func buy() -> BeverageProduct? {
        return self.productLine.popLast()
    }
    
    func isEmpty() -> Bool {
        return self.productLine.isEmpty
    }
    
    func updateNumberLabel(_ update: (Int) -> Void) {
        update(productLine.count)
    }
}
