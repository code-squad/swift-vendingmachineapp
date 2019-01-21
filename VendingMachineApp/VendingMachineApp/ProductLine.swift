//
//  ProductLine.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 19. 1. 17..
//  Copyright © 2019 hngfu. All rights reserved.
//

import Foundation

let productLineKey: String = "productLine"

class ProductLine: NSObject, NSCoding {
    
    //MARK: - encode,decode
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.productLine, forKey: productLineKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let productLine = aDecoder.decodeObject(forKey: productLineKey) as! [Beverage]
        self.init(beverageType: type(of:productLine[0]))
        self.productLine = productLine
    }
    
    init(beverageType: Beverage.Type) {
        self.beverageType = beverageType
    }
    
    //MARK: - Properties
    //MARK: Private
    
    private let beverageType: Beverage.Type
    private var productLine: [Beverage] = [] {
        didSet {
            
            guard let labelToUpdate = Mapper.shared.mapping(by: self.beverageType) else { return }
            let userInfo: [String: Int] = [UserInfoKey.numberOfProduct: productLine.count,
                                           UserInfoKey.labelToUpdate: labelToUpdate,]
            
            NotificationCenter.default.post(name: .didChangeNumberOfProduct, object: nil, userInfo: userInfo)
        }
    }
    
    //MARK: - Methods
    
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
    
    func isBuyable(balance: Balance) -> Bool {
        
        guard let beverage = productLine.first else { return false }
        return beverage.isBuyable(balance: balance)
    }
}
