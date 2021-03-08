//
//  Georgia.swift
//  VendingMachineApp
//
//  Created by 박혜원 on 2021/02/26.
//

import Foundation
import UIKit

class Georgia : Coffee {
    
    enum Kind {
        case original
        case caffelatte
    }
    let kind : Kind

    init(brand: String, capacity: Int, price: Int, name: String, createdAt: String, expiredAt: String, caffeine: Int, hot: Bool, kind: Georgia.Kind, image : UIImage?) {
        self.kind = kind
        super.init(brand: brand,
                   capacity: capacity,
                   price: price,
                   name: name,
                   createdAt: createdAt,
                   expiredAt: expiredAt,
                   caffeine: caffeine,
                   hot : hot,
                   image: UIImage(named: "georgia"))
    }
    
    convenience init(createdAt : String, expiredAt : String, hot: Bool = false, kind : Georgia.Kind = .original){
        self.init(brand: "조지아",
                   capacity: 275,
                   price: 1000,
                   name: "조지아오리지널",
                   createdAt: createdAt,
                   expiredAt: expiredAt,
                   caffeine: 100,
                   hot: hot,
                   kind: kind,
                   image: UIImage(named: "georgia"))
    }
}

