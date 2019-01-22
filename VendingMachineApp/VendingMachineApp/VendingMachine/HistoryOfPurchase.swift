//
//  HistoryOfPurchase.swift
//  VendingMachineApp
//
//  Created by 조재흥 on 19. 1. 11..
//  Copyright © 2019 hngfu. All rights reserved.
//

import UIKit

class HistoryOfPurchase: NSObject, NSCoding {
    
    //MARK: - Keys
    
    private let historyOfPurchaseKey: String = "historyOfPurchase"
    
    //MARK: Encode, Decode
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(historyOfPurchase, forKey: self.historyOfPurchaseKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        historyOfPurchase = aDecoder.decodeObject(forKey: self.historyOfPurchaseKey) as! [Beverage]
    }
    
    //MARK: - Properties
    //MARK: Private
    
    private var historyOfPurchase: [Beverage] = [] {
        didSet {
            
            guard let recentPurchaseProduct = historyOfPurchase.last else { return }
            let userInfo: [String: Beverage] = [UserInfoKey.recentPurchaseProduct: recentPurchaseProduct]
            
            NotificationCenter.default.post(name: .didChangeHistoryOfPurchase, object: nil, userInfo: userInfo)
        }
    }
    
    //MARK: - Methods
    
    func add(beverage: Beverage) {
        historyOfPurchase.append(beverage)
    }
    
    func perform(_ addHistoryImageViews: ([Beverage]) -> Void) {
        addHistoryImageViews(self.historyOfPurchase)
    }
}
