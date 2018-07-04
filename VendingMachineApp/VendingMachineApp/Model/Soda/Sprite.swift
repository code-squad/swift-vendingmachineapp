//
//  Sprite.swift
//  VendingMachineApp
//
//  Created by moon on 2018. 6. 23..
//  Copyright © 2018년 moon. All rights reserved.
//

import Foundation

class Sprite: Soda {
    private var brand: String
    
    override init(name: String, price: Int, calorie: Int) {
        self.brand = "칠성사이다"
        super.init(name: name, price: price, calorie: calorie)
    }
    
    convenience init() {
        self.init(name: DefaultData.sprite.name, price: DefaultData.sprite.price, calorie: 50)
    }
    
    private struct NSCoderKeys {
        static let brandKey = "brand"
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(brand as NSString, forKey: NSCoderKeys.brandKey)
    }
    
    required init?(coder aDecoder: NSCoder) {
        guard let brand = aDecoder.decodeObject(of: NSString.self, forKey: NSCoderKeys.brandKey) else {
            return nil
        }
        self.brand = brand as String
        super.init(coder: aDecoder)
    }
}
