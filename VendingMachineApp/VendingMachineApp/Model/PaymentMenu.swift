//
//  PaymentMenu.swift
//  VendingMachineApp
//
//  Created by HOONHA CHOI on 2021/03/13.
//

import Foundation

class PaymentMenu : NSObject, NSCoding {
    private(set) var list : [Int]
    
    override init() {
        self.list = [1000,5000]
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(list, forKey: "list")
    }

    required init?(coder: NSCoder) {
        self.list = coder.decodeObject(forKey: "list") as! [Int]
    }
}
