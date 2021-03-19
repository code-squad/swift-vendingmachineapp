//
//  File.swift
//  VendingMachineApp
//
//  Created by 이다훈 on 2021/02/24.
//

import Foundation

class Drinks : NSObject, NSCoding {
    
    enum errorCase : Error {
        case outOfIndex
    }
    
    private var drinks : [Drink]
    
    override init() {
        self.drinks = []
    }
    
    required init?(coder: NSCoder) {
        drinks = coder.decodeObject(forKey: "drinks") as! [Drink]
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(drinks,forKey: "drinks")
    }
    
    func addDrink(what product : Drink) {
        drinks.append(product)
    }
    
    func doClosure(closure : (([Drink]) -> Void)) {
        closure(drinks)
    }
    
    /// if fail -> return false.
    func remove(at productType : Drink.Type) throws -> Drink {
        guard let removeTarget = drinks.firstIndex(where: {
            $0.isSameType(with: productType)
        })
        else {
            throw errorCase.outOfIndex
        }
        return drinks.remove(at: removeTarget)
    }
    
    func showDrinks() -> Dictionary<ObjectIdentifier,[Drink]> {
        
        return drinks.reduce(into: [:]) { metaType, drink in
            metaType[ObjectIdentifier(type(of: drink.self)), default : []] += [drink]
        }
    }
    
    func showExpired() -> [Drink] {
        return drinks.filter() {
            guard let downCasting = $0 as? Milk else {
                return false
            }
            
            return downCasting.isWithInExpiration() == false
        }
    }
    
    func showHotDrinks() -> Set<String> {
        let hotDrinkArr = drinks.filter(){
            guard let downCasting = $0 as? TOP else {
                return false
            }
            return downCasting.isHot() == true
        }
        
        let returnDrinkNameArr : [String] = hotDrinkArr.map() {
            $0.name
        }
        
        return Set(returnDrinkNameArr)
    }
}
