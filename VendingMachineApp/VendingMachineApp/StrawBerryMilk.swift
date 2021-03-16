//
//  StrawBerryMilk.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/03/04.
//

import Foundation

class StrawBerryMilk : Milk{
    private let StrawBerryContent : Int
    
    init(StrawBerryContent : Int, fatContent:Int, brand: String, volume: Int, price: Int, name: String, manufactured: Date, temperature: Int, kcal: Int) {
        self.StrawBerryContent = StrawBerryContent
        super.init(fatContent: fatContent, brand: brand, volume: volume, price: price, name: name, manufactured: manufactured, temperature: temperature, kcal: kcal)
    }
    
    required convenience init(manufactured: Date) {
        self.init(StrawBerryContent: 30, fatContent: 10, brand: "서울우유", volume: 180, price: 2200, name: "진짜 리얼 딸기 우유", manufactured: manufactured, temperature: 10, kcal: 80)
    }
    
    required init?(coder: NSCoder) {
        self.StrawBerryContent = coder.decodeInteger(forKey: "StrawBerryContent")
        super.init(coder: coder)
    }
    
    override func encode(with coder: NSCoder) {
        coder.encode(self.StrawBerryContent, forKey: "StrawBerryContent")
        super.encode(with: coder)
    }
    
    func isHighContent(standard : Int) -> Bool {
        return StrawBerryContent > standard
    }
}
