//
//  Stock.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/03/02.
//

import Foundation

class Stock : NSObject, NSCoding {
    
    private(set) var products : [Beverage]
    
    init(_ items : [Beverage] = []){
        products = [Beverage]()
        super.init()
        self.append(items: items)
    }
    required convenience init?(coder: NSCoder) {
        guard let products = coder.decodeObject(forKey: "products") as? [Beverage] else { return nil }
        self.init(products)
    }
    func encode(with coder: NSCoder) {
        coder.encode(products, forKey: "products")
    }
    
    public func append(item : Beverage){
        products.append(item)
    }
    public func append(items: [Beverage]){
        products.append(contentsOf: items)
    }
    public func remove(item : Beverage) -> Bool {
        if let index = products.firstIndex(where: {$0 == item}) {
            products.remove(at: index)
            return true
        }
        return false
    }
    public func getAvailableProducts(with money : Money) -> [Beverage]{
        return products.filter{ $0.price <= money.coins }.map{$0}
    }
    
    public func getExpiredProducts() -> [Beverage] {
        return products.filter{ $0.isExpired(to: Date()) }.map{$0}
    }
    
    public func getHotDrink(than temperature : Int ) -> [Beverage] {
        let filtered = products.filter{ item in
            if let coffee = item as? Coffee {
                if coffee.isHot(than: temperature) {
                    return true
                }
            }
            return false
        }
        return filtered
    }
    
    public func toDictionary() -> Dictionary<ObjectIdentifier, [Beverage]>{
        var dict = Dictionary<ObjectIdentifier,[Beverage]>()
        
        for product in products {
            let key = ObjectIdentifier(type(of: product))
            if (dict[key] != nil) {
                dict[key]?.append(product)
            }else {
                dict[key] = [product]
            }
        }
        return dict
    }
}
