//
//  Stock.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/02.
//

import Foundation

class Stock {
    private(set) var products = [Beverage]()
    
    public func append(item : Beverage){
        products.append(item)
    }
    
    public func remove(item : Beverage) -> Bool {
        if let index = products.firstIndex(where: {$0 == item}) {
            products.remove(at: index)
            return true
        }
        return false
    }
/*
    public func getProduct<T>(type element : T.Type) -> Beverage?{
        for (product, _) in products {
            if element == type(of: product) {
                return product
            }
        }
        return nil
    }
*/
    public func getAvailableProducts(with money : Money) -> [Beverage]{
        return products.filter{ $0.price <= money.coins }.map{$0}
    }
    
    public func getExpiredProducts() -> [Beverage] {
        return products.filter{ $0.isExpired() }.map{$0}
    }
    
    public func getHotDrink() -> [Beverage] {
        let filtered = products.filter{ item in
            if let coffee = item as? Coffee {
                if coffee.isHot() {
                    return true
                }
            }
            return false
        }
        return filtered
    }
    
    public func toDictionary() -> Dictionary<ObjectIdentifier, Int>{
        return products.toDictionary()
    }
}
