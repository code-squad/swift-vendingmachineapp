//
//  Coke.swift
//  VendingMachine
//
//  Created by 김수현 on 2018. 5. 24..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Coke: Soda {
    
    private let calorie = 5
    
    override init(_ brand: String, _ volume: Int, _ price: Int, _ name: String, _ date: Date) {
        super.init(brand, volume, price, name, date)
        self.kind = "팹시콜라"
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    convenience init() {
        self.init("팹시", 350, 2000, "다이어트콜라", DateUtility.makeToday())
    }
    
    override func isLowCalorie() -> Bool {
        return 10 > self.calorie
    }
}
