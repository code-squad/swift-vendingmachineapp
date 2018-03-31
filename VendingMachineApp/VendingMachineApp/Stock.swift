//
//  Stock.swift
//  VendingMachine
//
//  Created by YOUTH on 2018. 3. 8..
//  Copyright © 2018년 JK. All rights reserved.
//

import Foundation

class Stock: NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {
        var items = [[Beverage]]()
        for set in self.inventory {
            items.append(set.value)
        }
        aCoder.encode(items, forKey: "items")
    }

    required init?(coder aDecoder: NSCoder) {
        guard let tempItems = aDecoder.decodeObject(forKey: "items") as? [[Beverage]] else {
            return
        }
        let flattenItems = tempItems.joined()
        let itemSets = flattenItems.reduce(into: [ObjectIdentifier: [Beverage]]()) {
            $0[ObjectIdentifier(type(of: $1)), default:[]].append($1)
        }
           self.inventory = itemSets
    }

    private var inventory = [ObjectIdentifier: [Beverage]]()

    override init() {}

    init(items: [Beverage]) {
        let itemSets = items.reduce(into: [ObjectIdentifier: [Beverage]]()) {
            $0[ObjectIdentifier(type(of: $1)), default:[]].append($1)
        }
        self.inventory = itemSets
    }

    init(sets: [ObjectIdentifier: [Beverage]]) {
        self.inventory = sets
    }

    func currentInventory() -> [ObjectIdentifier: [Beverage]] {
        return self.inventory
    }

    func removeItem(_ key: ObjectIdentifier) {
        self.inventory[key]!.remove(at: 0)
    }

    func buy(itemCode key: ObjectIdentifier) -> Beverage {
        let item = self.inventory[key]![0]
        return item
    }

    func addItem(_ item: Beverage) {
        for set in self.inventory {
            if var arr = self.inventory[ObjectIdentifier(type(of: item))] {
                arr.append(item)
                self.inventory[ObjectIdentifier(type(of: item))] = arr
                break
            } else if set.key != ObjectIdentifier(type(of: item)) {
                let newItemSet = [ObjectIdentifier(type(of: item)) : [item]]
            }
        }
    }

    func finditemsCheaper(than balance: Money) -> [ObjectIdentifier: [Beverage]] {
        var valid = [Beverage]()
        for set in self.inventory {
            for product in set.value {
                if balance.isAffordable(item: product) {
                    valid.append(product)
                }
            }
        }
        return self.setAsDictionary(valid)
    }

    func findValidBeverage() -> [ObjectIdentifier: [Beverage]] {
        var valid = [Beverage]()
        for set in self.inventory {
            for product in set.value {
                if product.isValid() {
                    valid.append(product)
                }
            }
        }
        return self.setAsDictionary(valid)
    }

    func findDiscardBeverage() -> [ObjectIdentifier: [Beverage]] {
        var discards = [Beverage]()
        for set in self.inventory {
            for product in set.value {
                if !product.isValid() {
                    discards.append(product)
                }
            }
        }
        return self.setAsDictionary(discards)
    }

    func findHotBeverage() -> [ObjectIdentifier: [Beverage]] {
        var hotItems = [Beverage]()
        for set in self.inventory {
            for item in set.value {
                if item.isHot() {
                    hotItems.append(item)
                }
            }
        }
        return self.setAsDictionary(hotItems)
    }

    private func setAsDictionary (_ beverages: [Beverage]) -> [ObjectIdentifier: [Beverage]] {
        let stockSets = beverages.reduce(into: [ObjectIdentifier: [Beverage]]()) {
            $0[ObjectIdentifier(type(of: $1)), default:[]].append($1)
        }
        return stockSets
    }

    func cheapestPrice() -> Int {
        var price = [Int]()
        for set in self.inventory {
            for product in set.value {
                price.append(product.price())
            }
        }
        let cheapest = price.sorted()[0]
        return cheapest
    }

    func menu(itemCodes: Shelf) -> String {
        var result = ""
        var index = 0

        for itemCode in itemCodes.itemTags where self.inventory[itemCode]!.count > 0 {
            let item = self.inventory[itemCode]![0]
            index += 1
            result += "\(index)) \(item.type) : \(item.price())원 | \(self.inventory[itemCode]!.count)개 \n"
        }
        return result
    }

    func summary() -> String {
        var result = ""
        for set in self.inventory where set.value.count > 0 {
            result += "\(set.value[0].type) (\(set.value.count)개) | "
        }
        return result
    }

    func howManyItem(_ itemCode: ObjectIdentifier) -> Int {
        guard let items = inventory[itemCode] else {
            return 0
        }
        return items.count
    }


}
