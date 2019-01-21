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
        self.productLine = aDecoder.decodeObject(forKey: productLineKey) as! [Beverage]
    }
    
    //MARK: - Properties
    //MARK: Private
    
    private var productLine: [Beverage] = [] {
        didSet {
            guard productLine.count != 0 else { return }
            guard let labelToUpdate = Mapper.shared.mapping(by: type(of: productLine[0])) else { return }
            let userInfo: [String: Int] = [UserInfoKey.numberOfProduct: productLine.count,
                                           UserInfoKey.labelToUpdate: labelToUpdate,]
            
            NotificationCenter.default.post(name: .didChangeNumberOfProduct, object: nil, userInfo: userInfo)
        }
    }
    
    //MARK: - Methods
    //MARK: Private
    
    func add(_ beverage: Beverage) {
        self.productLine.append(beverage)
    }
    
    func buy() -> Beverage? {
        return self.productLine.popLast()
    }
    
    func isEmpty() -> Bool {
        return self.productLine.isEmpty
    }
    
    func updateNumberLabel(_ update: (Int) -> Void) {
        update(productLine.count)
    }
}
