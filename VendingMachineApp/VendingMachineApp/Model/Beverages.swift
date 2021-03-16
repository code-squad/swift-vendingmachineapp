//
//  Beverages.swift
//  VendingMachineApp
//
//  Created by sonjuhyeong on 2021/03/03.
//

import Foundation

class Beverages: NSObject, NSCoding {
    
    private var beverages: [Beverage]
    
    override init() {
        self.beverages = [Beverage]()
    }
    
    //MARK: encode 메소드, required init
    func encode(with coder: NSCoder) {
        coder.encode(self.beverages, forKey: "beverages")
    }
    
    required init?(coder: NSCoder) {
        self.beverages = coder.decodeObject(forKey: "beverages") as! [Beverage]
    }
    
    func addBeverage(beverage: Beverage) {
        beverages.append(beverage)
    }
    
    func retrieveBeverage(completion: (Beverage) -> Void) {
        beverages.forEach{(
            completion($0)
        )}
    }
    
    func removeBeverage(beverage: Beverage) -> Beverage {
        let beverageIndex = beverages.firstIndex(of: beverage) ?? -1
        return beverages.remove(at: beverageIndex)
    }
    
    func checkBeverageStock() -> [ObjectIdentifier: [Beverage]] {
        var stock = [ObjectIdentifier: [Beverage]]()
        beverages.forEach { (beverage) in
            if stock[ObjectIdentifier(type(of: beverage.self))] == nil {
                stock[ObjectIdentifier(type(of: beverage.self))] = [beverage]
            }else{
                stock[ObjectIdentifier(type(of: beverage.self))]?.append(beverage)
            }
        }
        return stock
    }
}
