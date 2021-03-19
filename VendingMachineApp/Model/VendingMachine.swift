//
//  VendingMachine.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/25.
//

import Foundation

protocol UserOfVendingMachine {
    func charge(coins : Int)
    func uncharge(coins : Int)
    func purchase(with beverage : Beverage) -> Beverage?
    func getHotDrink(than temperature : Int) -> [Beverage]
    func getProduct(with beverageType : Beverage.Type) -> Beverage?
    func availableProducts() -> [Beverage]
    func availableWithCurrentCoin(to beverage : Beverage) -> Bool
    func returnCoins() -> Int
    func getCoins() -> Int
    func getSoldProducts() -> [Beverage]
    func getTotalStock() -> Dictionary<ObjectIdentifier,[Beverage]>
}
protocol AdminOfVendingMachine : UserOfVendingMachine {
    func append(product : Beverage)
    func appendToHistroy(buy : Beverage)
    func expiredProduct () -> [Beverage]
}

class VendingMachine : NSObject, NSCoding {
    
    private var money : Money
    private var stock : Stock
    private var soldHistory : Stock
    
    static let StockCountChanged = Notification.Name("StockCountChanged")
    static let CoinChanged = Notification.Name("CoinChanged")
    static let SoldHistoryChanged = Notification.Name("SoldHistoryChanged")
    
    init(money : Money, stock: Stock, soldHistory : Stock){
        self.money = money
        self.stock = stock
        self.soldHistory = soldHistory
    }
    
    override init(){
        self.money = Money()
        self.stock = Stock()
        self.soldHistory = Stock()
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let money = aDecoder.decodeObject(forKey: "money") as? Money,
              let stock = aDecoder.decodeObject(forKey: "stock") as? Stock,
              let soldHistory = aDecoder.decodeObject(forKey: "soldHistory") as? Stock
        else { return nil }
        
        self.init(money : money, stock : stock, soldHistory : soldHistory)
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(money, forKey: "money")
        coder.encode(stock, forKey: "stock")
        coder.encode(soldHistory, forKey: "soldHistory")
    }
    
    //  전체 상품 재고를 (사전으로 표현하는) 종류별로 리턴하는 메소드
    public func getTotalStock() -> Dictionary<ObjectIdentifier,[Beverage]> {
        return stock.toDictionary()
    }
}

extension VendingMachine : AdminOfVendingMachine {
    //  특정 상품 인스턴스를 넘겨서 재고를 추가하는 메소드
    public func append(product : Beverage){
        stock.append(item: product)
        NotificationCenter.default.post(name: VendingMachine.StockCountChanged, object: self)
    }
    internal func appendToHistroy(buy : Beverage){
        soldHistory.append(item: buy)
        NotificationCenter.default.post(name: VendingMachine.SoldHistoryChanged, object: self)
    }
    //  시작이후 구매 상품 이력을 배열로 리턴하는 메소드
    public func getSoldProducts() -> [Beverage]{
        return soldHistory.products
    }
    //  유통기한이 지난 재고만 리턴하는 메소드
    public func expiredProduct () -> [Beverage] {
        return stock.getExpiredProducts()
    }
}

extension VendingMachine : UserOfVendingMachine{
    
    //  자판기 금액을 원하는 금액만큼 올리는 메소드
    public func charge(coins : Int){
        money.add(with: coins)
        NotificationCenter.default.post(name: VendingMachine.CoinChanged, object: self)
    }
    //  자판기 금액을 원하는 금액만큼 내리는 메소드
    public func uncharge(coins : Int){
        money.minus(with: coins)
        NotificationCenter.default.post(name: VendingMachine.CoinChanged, object: self)
    }
    public func purchase(with beverage : Beverage) -> Beverage?{
        if stock.remove(item: beverage) {
            appendToHistroy(buy: beverage)
            uncharge(coins: beverage.price)
            NotificationCenter.default.post(name: VendingMachine.StockCountChanged, object: self)
        }
        return beverage
    }
    //  따뜻한 음료만 리턴하는 메소드
    public func getHotDrink(than temperature : Int) -> [Beverage] {
        stock.getHotDrink(than: temperature)
    }
    public func getProduct(with beverageType : Beverage.Type) -> Beverage?{
        let dict = stock.toDictionary()
        return dict[ObjectIdentifier(beverageType)]?.first
    }
    //  현재 금액으로 구매가능한 음료수 목록을 리턴하는 메소드
    public func availableProducts() -> [Beverage]{
        return stock.getAvailableProducts(with: money)
    }
    // 현재 금액으로 구매 가능한 지 확인하는 메소드
    public func availableWithCurrentCoin(to beverage : Beverage) -> Bool{
        return money.isPurchasable(with : beverage.price)
    }
    //  잔액을 돌려주는 메소드
    public func returnCoins() -> Int {
        NotificationCenter.default.post(name: VendingMachine.CoinChanged, object: self)
        return money.resetCoins()
    }
    // 잔액을 확인하는 메소드
    public func getCoins() -> Int {
        return money.coins
    }
}
