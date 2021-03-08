//
//  Beverages.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/03/06.
//

import UIKit

class Beverages{
    private var beverages : [Beverage]
    
    init() {
        beverages = []
    }
    
    func addBeverage(beverage : Beverage) -> Void{
        beverages.append(beverage)
    }
    
    func showValidatecurrentBeverageList() -> [Beverage]{
        var beverageList : [Beverage] = []
        for i in 0..<self.beverages.count{
            if self.beverages[i].isValidate(Date()){
                beverageList.append(self.beverages[i])
            }
        }
        return beverageList
    }
    
    func takeBeverage(beverage : Beverage){
        if let removeTarget = beverages.firstIndex(of: beverage){
            self.beverages.remove(at: removeTarget)
        }
    }
    
    func showLowerpriceThanMoney(money : Money) -> [Beverage]{
        var beverageList : [Beverage] = []
        for i in 0..<self.beverages.count{
            if self.beverages[i].canBuybeverage(money: money) {
                beverageList.append(self.beverages[i])
            }
        }
        return beverageList
    }
    
    func isHotBeverages() -> [Beverage]{
        var beverageList : [Beverage] = []
        for i in 0..<self.beverages.count{
            if self.beverages[i].isHot(){
                beverageList.append(self.beverages[i])
            }
        }
        return beverageList
    }
    
    func beveragesList() -> [String : Int]{
        var tempdictionary : [String : Int] = [:]
        for i in 0..<beverages.count{
            beverages[i].addProduct(productList: &tempdictionary)
        }
        return tempdictionary
    }
}
