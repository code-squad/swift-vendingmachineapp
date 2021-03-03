//
//  Stock.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/02.
//

import Foundation

class Stock {
    private var products = Dictionary<Beverage,Int>()
    
    public func append(item : Beverage){
        if products[item] == nil{
            products[item] = 0
        }
        let value = products[item]
        products.updateValue(value! + 1, forKey: item)
    }
    
    public func remove(item : Beverage) -> Bool {
        guard let removeOne = products[item] else {
            return false
        }
        if removeOne < 1 {
            return false
        }
        products.updateValue(removeOne - 1,forKey: item)
        return true
    }
    /*
    public func getProduct<T>(type target : T) -> Beverage?{
//        let value = products.first(where: {$0.key as? item})
        var item : Beverage
        for product in products.keys { 
            if type(of: product) as? target {
                return product
            }
        }
        return nil
    }
    */
    
    public func availableProducts(with money : Money) -> [Beverage]{
        return products.filter{ $0.key.price <= money.coins }.map{$0.key}
    }
    
    public func expiredProducts() -> [Beverage] {
        return products.filter{ $0.key.isExpired() }.map{$0.key}
    }
    
    public func getHotDrink() -> [Beverage] {
        var list = [Beverage]()
        products.forEach{ (item, count) in
            if let coffee = item as? Coffee {
                if coffee.isHot() { list.append(coffee) }
            }
        }
        return list
    }
    
    public func toArray() -> [Beverage]{
        var list = [Beverage]()
        products.forEach{ (item, count) in
            list.append(item)
        }
        return list
    }
}
