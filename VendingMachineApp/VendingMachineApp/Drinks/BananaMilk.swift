//
//  BananaMilk.swift
//  VendingMachineApp
//
//  Created by 윤동민 on 16/01/2019.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

class BananaMilk: Milk {
    private var bananaJuiceAmount: Double
    
    init(name: String, volume: Int, brand: String, date: String, fat: Bool, bananaAmount: Double) {
        self.bananaJuiceAmount = bananaAmount
        super.init(name: name, volume: volume, price: 1500, brand: brand, date: date, fat: fat)
    }
    
    convenience init() {
        self.init(name: "서울우유",
                  volume: 200,
                  brand: "빙그레바나나우유",
                  date: "20190220",
                  fat: true,
                  bananaAmount: 1.1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.bananaJuiceAmount = aDecoder.decodeDouble(forKey: "bananaJuiceAmount")
        super.init(coder: aDecoder)
    }
    
    override func encode(with aCoder: NSCoder) {
        super.encode(with: aCoder)
        aCoder.encode(bananaJuiceAmount, forKey: "bananaJuiceAmount")
    }
    
    func isHighJuiceAmount() -> Bool {
        return bananaJuiceAmount > 1.0
    }
    
    override func convertToImageName() -> String {
        return "바나나우유"
    }
}
