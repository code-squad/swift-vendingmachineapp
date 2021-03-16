//
//  Beverages.swift
//  VendingMachineApp
//
//  Created by 박정하 on 2021/03/06.
//

import Foundation

class Beverages : NSObject , NSCoding{
    private var beverages : [Beverage]
    private let beverageTypeList : [Beverage.Type]
    
    override init() {
        beverages = []
        beverageTypeList = [BananaMilk.self, StrawBerryMilk.self, Cider.self, Coke.self, Hot6.self, Monster.self, CaffeMocha.self, CaffeeLatte.self]
    }
    
    required init?(coder: NSCoder) {
        self.beverages = coder.decodeObject(forKey: "beverages") as? [Beverage] ?? []
        self.beverageTypeList = [BananaMilk.self, StrawBerryMilk.self, Cider.self, Coke.self, Hot6.self, Monster.self, CaffeMocha.self, CaffeeLatte.self]
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.beverages, forKey: "beverages")
    }
    
    func addBeverage(beverage : Beverage) -> Void{
        beverages.append(beverage)
        NotificationCenter.default.post(name: NSNotification.Name("addSomething"), object: nil)
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
    
    func showLowerpriceThan(money : Money) -> [Beverage]{
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
    
    func makeBeverageofFactroy() -> [Beverage]{
        var tempBeverages : [Beverage] = []
        for i in 0..<beverageTypeList.count{
            tempBeverages.append(BeverageCreater().makeBeverage(beveragetype: beverageTypeList[i], manufactured: Date().makeDatewithString(yyyyMMdd: "20200303")))
        }
        return tempBeverages
    }
    
    func beveragesList() -> [String : Int]{
        var tempdictionary : [String : Int] = [:]
        for i in 0..<beverages.count{
            beverages[i].addProduct(productList: &tempdictionary)
        }
        return tempdictionary
    }
    
    private func makeCurrentBeverageObjectIdentifierList() -> [ObjectIdentifier : Int]{
        var tempList : [ObjectIdentifier : Int] = [:]
        for i in 0..<beverages.count{
            beverages[i].addProductType(productTypeList: &tempList)
        }
        return tempList
    }
    
    func sendCurrentBeverageObjectIdentifierCount(beverage : Beverage) -> Int{
        let tempbeverageList : [ObjectIdentifier : Int] = makeCurrentBeverageObjectIdentifierList()
        var tempResult = 0
        if let tempbeverageCount = tempbeverageList[ObjectIdentifier(beverage)]{
            tempResult = tempbeverageCount
        }
        return tempResult
    }
}
