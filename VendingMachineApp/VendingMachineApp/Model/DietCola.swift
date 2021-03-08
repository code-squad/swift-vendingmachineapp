//
//  DietCola.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/02/23.
//

import Foundation

class DietCola : Soda {
    enum TasteType : Int {
        case lemon
        case lime
    }
    private let taste : TasteType
    
    init(brand: String, amount : Int, unit : Unit, price: Int, name: String, manufactured: Date, sugarContent : Int ,expiration: Date, temperature : Int, calorie : Int, taste : TasteType) {
        self.taste = .lemon
        super.init(brand: brand, amount : amount, unit : unit, price: price, name: name, manufactured: manufactured, sugarContent : sugarContent, expiration: expiration, temperature : temperature, calorie : calorie)
    }
    
    convenience init() {
        self.init(brand: "팹시",
                  amount : 350,
                  unit : .Milliliter,
                  price: 2000,
                  name: "다이어트콜라",
                  manufactured: Date.make(date: "20210222"),
                  sugarContent : 5,
                  expiration: Date.make(date: "20210303"),
                  temperature : 10,
                  calorie : 123,
                  taste: .lemon)
    }
    
    required init?(coder: NSCoder) {
        self.taste = TasteType(rawValue: coder.decodeInteger(forKey: "taste"))!
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(taste.rawValue, forKey: "taste")
        super.encode(with: coder)
    }
}
